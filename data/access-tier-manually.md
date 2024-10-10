## Lab: Managing Azure Blob Storage Access Tiers

In this lab, you will learn how to manage Azure Blob Storage access tiers, including how to manually change access tiers and rehydrate archived blobs. 
The focus is on optimizing storage costs based on data usage patterns.

#### Lab Objectives:
- Understand Azure Blob Storage access tiers (Hot, Cool, and Archive).
- Create a folder in a blob container and upload blobs to that folder.
- Manually change blob access tiers within the folder.
- Rehydrate a blob from the Archive tier.

---

### Prerequisites:
- An active Azure Storage account.
- Basic knowledge of Azure Storage concepts.
- Azure CLI or Azure Portal access.

---

### Scenario:

You are working on a data archival solution for your organization. Some files need to be archived as they are not accessed frequently, while others need to remain in a more accessible state. 
You have uploaded multiple files to an Azure Storage account, and now you need to:
1. Organize the blobs by creating a folder and moving files into that folder.
2. Move certain blobs to the **Archive** tier to save costs.
3. Later, you receive a request to access one of the archived files, so you'll need to manually rehydrate it by changing its tier back to **Hot** or **Cool**.

---

### Steps:

#### 1. Create a Blob Folder and Upload Blobs

1. Navigate to your Azure Storage account in the **Azure Portal**.
2. Under **Data Storage**, select **Containers**.
3. Create or select an existing container (e.g., `project-data`).
4. Create a folder within the container:
   - Click on **+ Folder** (or **Upload** if the UI does not support folder creation directly).
   - Name the folder (e.g., `reports`).
5. Once the folder is created, upload blobs to that folder:
   - Create a new file in local system `weekly-report.csv` and add some content in it.
   - Create a new file in local system `monthly-summary.xlsx` and add some content in it.
   - Click on the folder (`reports`) to open it.   
   - Click **Upload** and select files (`weekly-report.csv`, `monthly-summary.xlsx`) to upload them into the folder.

#### 2. Manually Change the Blob Access Tier

You’ll now change the access tier of some blobs that are rarely accessed.

1. Open the **reports** folder within the container.
2. Select a blob `monthly-summary.xlsx` from the folder.
3. In the **Overview** pane, click **Change tier**.
4. Select **Archive** to move this blob to the Archive tier, which is cost-efficient for infrequently accessed data.
5. Click **Save**.

#### 3. Rehydrate an Archived Blob (Change Access Tier Back)

After a week, you receive a request to access `monthly-summary.xlsx`. Since it is in the **Archive** tier, it must be rehydrated before accessing.

1. Navigate to the **reports** folder and select `monthly-summary.xlsx`.
2. Notice that its access tier is listed as **Archive**.
3. Click **Change tier** and select either:
   - **Hot** (if the blob will be frequently accessed).
   - **Cool** (if the blob will be infrequently accessed).
4. Click **Save** to trigger the rehydration process.

> **Note**: Rehydrating a blob from the **Archive** tier can take several hours, depending on the size of the blob.

#### 4. Monitor Rehydration Status

1. While waiting for the rehydration, check the **Blob properties** for the status:
   - **Pending**: The rehydration process is ongoing.
   - **Active**: The blob has been rehydrated and is ready for access.
2. Once the status changes to **Active**, you can download or access the blob.

---

### Conclusion

In this lab, you learned how to manage Azure Blob Storage access tiers, including creating a folder, uploading blobs into that folder, moving blobs to the **Archive** tier, and rehydrating them when needed. 
This helps manage storage costs efficiently while ensuring data remains accessible when required.
