## Encrypt Data with Customer Managed Key

### Objective:

The objective of this lab is to demonstrate how to securely configure and manage access to an Azure Storage Account using managed identities and Azure Key Vault. By the end of this lab, participants will:

1. **Create and configure an Azure Storage Account** with infrastructure encryption enabled.
2. **Create a managed identity** and assign appropriate access roles to securely interact with the storage account.
3. **Set up a Key Vault** and generate a customer-managed key for encrypting storage account data.
4. **Assign necessary roles and permissions** to managed identities to enable secure access and encryption using customer-managed keys.
5. **Implement role-based access control (RBAC)** and demonstrate key management with Azure Key Vault, ensuring compliance with security and access management best practices.


### Scenario:

You are working as a cloud engineer for a company that needs to securely store sensitive data in Azure Storage. The company requires that all storage accounts must use **customer-managed keys** for encryption and that access to the storage account is restricted to specific applications using **managed identities**. Additionally, the security policy mandates that encryption keys must be stored in Azure Key Vault with strict role-based access control (RBAC) to manage who can access and manage these keys.

In this lab, you will simulate this scenario by:
1. **Creating a storage account** with encryption enabled.
2. **Configuring a managed identity** for an application to securely access the storage account.
3. **Setting up a Key Vault** to store the customer-managed encryption keys.
4. **Assigning permissions** to allow the managed identity to access the storage account and use the encryption keys.

By the end of this exercise, you will have implemented a secure, access-controlled environment for sensitive data storage, aligned with the company's security and compliance requirements.


### Tasks

- Create the storage account and managed identity.
- Secure access to the storage account with a key vault and key.
- Configure the storage account to use the customer managed key in the key vault
- Configure an time-based retention policy and an encryption scope.

---

### Create the storage account and managed identity

1. Provide a storage account for the web app. 
    - In the portal, search for and select **Storage accounts**. 
    - Select **+ Create**.
    - For **Resource group** select **Create new**. Give your resource group a **name** `StorageDemo-RG` and select **OK** to save your changes.
    - Provide a **Storage account name**. Ensure the name is unique and meets the naming requirements.
    - Move to the **Encryption** tab.
    - Check the box for **Enable infrastructure encryption**.
    - Notice the warning, *This option cannot be changed after this storage account is created.*
    - Select **Review + Create**.
    - Wait for the resource to deploy.

1. Provide a managed identity for the web app to use.

    - Search for and select **Managed identities**.
    - Select **Create**.
        - Select your **resource group** (`StorageDemo-RG`). 
        - Give your managed identity a name.
    - Select **Review and create**, and then **Create**. 

1. Assign the correct permissions to the managed identity. The identity only needs to read and list containers and blobs. 
    
    - Search for and select your **storage account**.
    - Select the **Access Control (IAM)** blade.
    - Select **Add role assignment** (center of the page).
    - On the **Job functions roles** page, search for and select the **Storage Blob Data Reader** role. 
    - On the **Members** page, select **Managed identity**.
    - Select **Select members**, in the **Managed identity** drop-down select **User-assigned managed identity**.
    - Select the managed identity you created in the previous step.
    - Click **Select** and then **Review + assign** the role.
    - Select **Review + assign** a second time to add the role assignment.
    - Your storage account can now be accessed by a managed identity with the Storage Data Blob Reader permissions.

---

### Secure access to the storage account with a key vault and key

1. To create the key vault and key needed for this part of the lab, your user account must have Key Vault Administrator permissions.
    - In the portal, search for and select **Resource groups**. 
    - Select your **resource group** (`StorageDemo-RG`), and then the **Access Control (IAM)** blade.
    - Select **Add role assignment** (center of the page).
    - On the **Job functions roles** page, search for and select the **Key Vault Administrator** role.
    - On the **Members** page, select **User, group, or service principal**.
    - Select **Select members**.
    - Search for and select your user account. Your user account is shown in the top right of the portal.
    - Click **Select** and then **Review + assign**.
    - Select **Review + assign** a second time to add the role assignment.
    - You are now ready to continue with the lab.

1. Create a key vault to store the access keys. 

    - In the portal, search for and select **Key vaults**.
    - Select **Create**.
    - Select your **resource group** (`StorageDemo-RG`).
    - Provide the **name** for the key vault. The name must be unique.
    - Ensure on the **Access configuration** tab that **Azure role-based access control (recommended)** is selected. 
    - Select **Review + create**.
    - Wait for the validation checks to complete and then select **Create**.
    - After the deployment, select **Go to resource**.
    - On the **Overview** blade ensure both **Soft-delete** and **Purge protection** are **enabled**. 

1. Create a customer-managed key in the key vault. 

    - In your **key vault**, in the **Objects** section, select the **Keys** blade.
    - Select **Generate/Import** and **Name** the key.
    - Take the defaults for the rest of the parameters, and **Create** the key.

---

### Configure the storage account to use the customer managed key in the key vault

1. Before you can complete the next steps, you must assign the Key Vault Crypto Service Encryption User role to the managed identity.
    - In the portal, search for and select **Resource groups**. 
    - Select your **resource group** (`StorageDemo-RG`), and then the **Access Control (IAM)** blade.
    - Select **Add role assignment** (center of the page).
    - On the **Job functions roles** page, search for and select the **Key Vault Crypto Service Encryption User** role.
    - On the **Members** page, select **Managed identity**.
    - Select **Select members**, in the **Managed identity** drop-down select **User-assigned managed identity**.
    - Select your managed identity.  
    - Click **Select** and then **Review + assign**.
    - Select **Review + assign** a second time to add the role assignment.
    
1. Configure the storage account to use the customer managed key in your key vault.
    - Return to your the storage account.
    - In the **Security + networking** section, select the **Encryption** blade.
    - Select **Customer-managed keys**.
    - **Select a key vault and key**. Select your key vault and key.
    - **Select** to confirm your choices. 
    - Ensure the **Identity type** is **User-assigned**.
    - **Select an identity**.
    - Select your managed identity then select **Add**. 
    - **Save** your changes.
    - If you receive an error that your identity does not have the correct permissions, wait a minute and try again.

---

Conclusion:
In this lab, you successfully created a storage account, assigned a managed identity to access the storage account, and secured the storage account with a customer-managed key from an Azure Key Vault.
