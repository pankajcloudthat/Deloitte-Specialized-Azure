## Lab: Data Protection in Azure Storage

In this lab, you will configure various **data protection** features on an Azure Storage Account to prevent accidental data loss or unauthorized modifications. 
You will configure a **resource lock**, **soft delete**, **blob versioning**, and an **immutable policy**, and then test each feature to ensure it works as expected.

---

### Objective:

By the end of this lab, you will:
- Create an Azure Storage Account.
- Apply a **resource lock** to prevent accidental deletion of the storage account.
- Configure and test **soft delete** on blobs and containers.
- Enable and test **blob versioning** for tracking modifications.
- Configure and test an **immutable policy** to prevent modifications or deletions for a specific period.

---

### Prerequisites:
- An active Azure subscription.
- Access to the **Azure Portal**.

---

### Step 1: Create a Storage Account

1. **Login to Azure Portal**:
   - Open the **Azure Portal** and sign in using your credentials.

2. **Search for Storage Accounts**:
   - In the search bar at the top, search for and select **Storage accounts**.

3. **Create a New Storage Account**:
   - Click **+ Create** to start creating a new storage account.
   - Select your **Subscription** and **Resource Group** (or create a new one).
   - Enter a **Storage account name** (e.g., `mydatastorage01`), ensuring the name is globally unique.
   - Select the **Region** where your storage account will be hosted.
   - Choose **Standard** performance and **Locally-redundant storage (LRS)** for redundancy (or your preferred settings).
   - Click **Review + Create**, then click **Create** after the validation completes.

---

### Step 2: Configure Resource Lock on Deletion of Storage Account

To prevent accidental deletion of the storage account, you will configure a **resource lock**.

1. **Navigate to Your Storage Account**:
   - In the **Azure Portal**, go to the **Storage accounts** section and select your newly created storage account.

2. **Add a Resource Lock**:
   - In the storage account’s left-hand menu, under **Settings**, click **Locks**.
   - Click **+ Add** to create a new lock.
   - Set **Lock Name** to `PreventDeletion`.
   - Select **Lock Type** as **Delete** (this will prevent deletion of the storage account).
   - Click **OK** to save the lock.

---

### Step 3: Configure Soft Delete on Blobs and Containers (30 Days Retention) and Test

Soft delete enables you to recover deleted blobs and containers within a retention period.

1. **Enable Soft Delete**:
   - Go to the **Data management** section in your storage account, and click **Data protection**.
   - Under **Blob soft delete**, toggle the option to **Enable soft delete for blobs** and set **Retention days** to **30**.
   - Also, enable **Container soft delete** and set the **Retention days** to **30**.
   - Click **Save**.

2. **Test Soft Delete**:
   - Navigate to **Containers** in the storage account.
   - Create a new container (e.g., `testcontainer`).
   - Upload a test blob (e.g., `testfile.txt`) into the container.
   - Delete the blob from the container by selecting it and clicking **Delete**.
   - Navigate to the **Deleted blobs** section in the container and restore the deleted blob.
   - Verify that the blob is successfully restored.

---

### Step 4: Configure Blob Versioning and Test

Blob versioning helps you keep track of modifications to blobs by creating different versions.

1. **Enable Blob Versioning**:
   - In the **Data protection** section, toggle the **Blob versioning** option to **Enabled**.
   - Click **Save**.

2. **Test Blob Versioning**:
   - Upload a test file (e.g., `versionedfile.txt`) into the container.
   - Modify the file and upload it again, overwriting the existing blob.
   - Navigate to the blob’s details and view the **Versions** tab to see the different versions created by the modifications.
   - You can select an older version to restore it if needed.

---

### Step 5: Configure Immutable Policy and Test

An **Immutable Blob Policy** ensures that blobs cannot be modified or deleted for a specific retention period.

1. **Set an Immutable Policy**:
   - Go to **Containers** in the storage account and select a container (e.g., `testcontainer`).
   - In the container toolbar, click **Immutable blob storage**.
   - Click **Add policy**.
   - Set the **Policy Type** to **Time-based retention**.
   - Specify the **Retention period** (e.g., 7 days).
   - Click **Save** to apply the policy.

2. **Test Immutable Policy**:
   - Try to delete or modify a blob in the container after setting the immutable policy.
   - You should see an error indicating that the blob cannot be modified or deleted due to the immutable policy in place.

---

### Conclusion:

In this lab, you have successfully:
- Created an Azure Storage Account.
- Configured a **resource lock** to prevent accidental deletion.
- Enabled and tested **soft delete** for blobs and containers.
- Enabled and tested **blob versioning** to track changes.
- Configured and tested an **immutable policy** to enforce data immutability for a defined retention period.

These data protection features ensure that your data remains safe from accidental deletions, unauthorized modifications, and potential data loss.
