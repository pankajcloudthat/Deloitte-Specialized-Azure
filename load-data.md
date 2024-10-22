## Load Data in Data Lake

### Perform the following tasks to prepare your environment for the labs.

1. In Azure portal open cloud shell when promted select **Power Shell**. If you are in **Bash** terminal switch to **Power Shell**.

2. In **Power Shell**, run the following commands to download the required course files. This may take a few minutes.

    ```
    mkdir dp-203

    cd dp-203

    git clone https://github.com/pankajcloudthat/DP-203-Data-Engineer.git .
    ```

3. In **Power Shell**, use the following command to change directories to the folder automation.
    ```
    cd Allfiles\00\artifacts\environment-setup\automation\
    ```

4. Create a file in the automation directory as follows:
   ```
   nano load-data.ps1
   ```
   
5. Copy the content of file [data-load-wwi-02.txt](https://raw.githubusercontent.com/pankajcloudthat/Deloitte-Specialized-Azure/refs/heads/main/load-data.ps1) and past in above created file.
6. To Save the file press **Ctrl + O** and then enter key.
7. Close the Nano edit, press **Ctrl + X** and then enter key.
8. Obtained the following information of **Synapse Default Storage Account** overview page from Azure Portal:
   - Subscription ID
   - Storage Account Name
   - Resource Group Name of your storage account.

9. Now in **Power Shell**, enter the following command to run the setup script:
        
    ```
    .\data-load-wwi-02.ps1
    ```

10. When prompted to sign into Azure, and click on the link it will open in browser; Enter the code which is also given in power shell window. After signing in, you can close the browser and return to Windows PowerShell.

11. When prompted, sign into your Azure account again same as you did in previous step (this is required so that the script can manage resources in your Azure subscription)

12. When promted enter the following information:
        - *Enter the subscription ID*
        - *Enter Storage Account Name*
        - *Enter Resource Group Name where your storage account is created*


7. Open Azure portal, go to the Azure Data Lake Gen 2 Storage account that you created in previous lab and create a new container **wwi-02**.


    
