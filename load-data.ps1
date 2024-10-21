# Import modules
Import-Module "..\solliance-synapse-automation"


# User must sign in using az login
Write-Host "Sign into Azure using your credentials.."
az login

# Now sign in again for PowerShell resource management and select subscription
Write-Host "Now sign in again to allow this script to create resources..."
Connect-AzAccount -UseDeviceAuthentication

# Enter the subscription ID
$selectedSub = Read-Host "Enter your subscription ID"

# Enter Storage Account Name
$dataLakeAccountName = Read-Host "Enter your Synapse Deafult Data Lake Name"

# Enter Resource Group Name where your storage account is.
$resourceGroupName = Read-Host "Enter your Synapse Resource Group Name"


if(-not ([string]::IsNullOrEmpty($selectedSub)))
{
    Select-AzSubscription -SubscriptionId $selectedSub
}


Write-Information "Copy Data"
Write-Host "Uploading data to Azure..."

Ensure-ValidTokens $true

if ([System.Environment]::OSVersion.Platform -eq "Unix")
{
        $azCopyLink = Check-HttpRedirect "https://aka.ms/downloadazcopy-v10-linux"

        if (!$azCopyLink)
        {
                $azCopyLink = "https://azcopyvnext.azureedge.net/release20200709/azcopy_linux_amd64_10.26.0.tar.gz"
        }

        Invoke-WebRequest $azCopyLink -OutFile "azCopy.tar.gz"
        tar -xf "azCopy.tar.gz"
        $azCopyCommand = (Get-ChildItem -Path ".\" -Recurse azcopy).Directory.FullName
        cd $azCopyCommand
        chmod +x azcopy
        cd ..
        $azCopyCommand += "\azcopy"
}
else
{
        $azCopyLink = Check-HttpRedirect "https://aka.ms/downloadazcopy-v10-windows"

        if (!$azCopyLink)
        {
                $azCopyLink = "https://azcopyvnext.azureedge.net/release20200501/azcopy_windows_amd64_10.4.3.zip"
        }

        Invoke-WebRequest $azCopyLink -OutFile "azCopy.zip"
        Expand-Archive "azCopy.zip" -DestinationPath ".\" -Force
        $azCopyCommand = (Get-ChildItem -Path ".\" -Recurse azcopy.exe).Directory.FullName
        $azCopyCommand += "\azcopy"
}

#$jobs = $(azcopy jobs list)

$download = $true;

$dataLakeStorageUrl = "https://"+ $dataLakeAccountName + ".dfs.core.windows.net/"
$dataLakeStorageBlobUrl = "https://"+ $dataLakeAccountName + ".blob.core.windows.net/"
$dataLakeStorageAccountKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -AccountName $dataLakeAccountName)[0].Value
$dataLakeContext = New-AzStorageContext -StorageAccountName $dataLakeAccountName -StorageAccountKey $dataLakeStorageAccountKey

# Creating new container wwi-02
New-AzStorageContainer -Name "wwi-02" -Context $dataLakeContext

$destinationSasKey = New-AzStorageContainerSASToken -Container "wwi-02" -Context $dataLakeContext -Permission rwdl

if ($download)
{
        Write-Information "Copying wwi-02 directory to the data lake..."
        $wwi02 = Resolve-Path "../../../../wwi-02"

        $dataDirectories = @{
                salesmall = "wwi-02,/sale-small/"
                analytics = "wwi-02,/campaign-analytics/"
                security = "wwi-02,/security/"
                salespoc = "wwi-02,/sale-poc/"
                datagenerators = "wwi-02,/data-generators/"
                profiles1 = "wwi-02,/online-user-profiles-01/"
                profiles2 = "wwi-02,/online-user-profiles-02/"
                customerinfo = "wwi-02,/customer-info/"
        }

        foreach ($dataDirectory in $dataDirectories.Keys) {

                $vals = $dataDirectories[$dataDirectory].tostring().split(",");

                $source = $wwi02.Path + $vals[1];

                $path = $vals[0];

                $destination = $dataLakeStorageBlobUrl + $path + $destinationSasKey
                Write-Information "Copying directory $($source) to $($destination)"
                & $azCopyCommand copy $source $destination --recursive=true
        }
}
