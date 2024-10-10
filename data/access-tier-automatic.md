## Lab: Automating Azure Blob Storage Access Tier Management

In this lab, you will learn how to automate the management of Azure Blob Storage access tiers based on defined policies. 
Specifically, you will create rules to change blob access tiers based on their last modified date and filter by specific folder locations and file types.

#### Lab Objectives:
- Understand Azure Blob Storage access tiers lifecycle managment policy.
- Create lifecycle management rules to automatically change blob access tiers based on modification dates.
- Implement filters to search for specific folder locations and file types.

---

### Prerequisites:
- An active Azure Storage account with a blob container.
- Basic knowledge of Azure Storage concepts.
- Access to Azure Portal.

---

### Scenario:

Your organization has a policy to optimize storage costs based on data usage patterns. The policy dictates the following:
1. Blobs in the **Hot** tier should be moved to the **Cool** tier if they were last modified more than 30 days ago.
2. Blobs in the **Cool** tier should be archived to the **Archive** tier if they were last modified more than 30 days ago.
3. The organization specifically wants to apply this policy to CSV files located in the `data/reports` folder.

You will implement these rules to ensure efficient management of your storage costs.

---

### Steps:

#### 1. Create a Blob Folder and Upload Blobs

1. Navigate to your Azure Storage account in the **Azure Portal**.
2. Under **Blob service**, select **Containers**.
3. Click on an existing container (e.g., `project-data`).
4. Create a folder within the container:
   - Click on **+ Folder** (if applicable) or upload files directly to create a new folder.
   - Name the folder `data/reports`.
5. Upload several CSV files (e.g., `report1.csv`, `report2.csv`) into the `data/reports` folder.

#### 2. Add Lifecycle Management Rules

1. In the Azure Portal, navigate to your storage account.
2. In the **Data management** section, select **Lifecycle management**.
3. Click on **+ Add a rule** to create a new lifecycle management rule.
4. Fill in the following details for the rule:
   - **Name**: Provide a descriptive name (e.g., `BlobTierManagement`).
   - **Rule scope**: Select the specific **container** (e.g., `project-data`) and set a **prefix** to target the `data/reports` folder.
   - **Blob filters**: Specify that you want to apply the rule only to **CSV** files:
     - **Blob types**: Select **Block blobs**.
     - **Blob name prefix**: Enter `data/reports/`.

5. Add conditions for tier transitions:
   - **Transition to Cool**: Set the condition to transition blobs from **Hot** to **Cool** if the blob was last modified more than **30 days ago**.
     - **Days after modification**: Enter `30`.
     - **Current tier**: Select **Hot**.
   - **Transition to Archive**: Set the condition to transition blobs from **Cool** to **Archive** if the blob was last modified more than **30 days ago**.
     - **Days after modification**: Enter `30`.
     - **Current tier**: Select **Cool**.

6. Review your rule and click **Create** to apply the lifecycle management rule.

#### 3. Monitoring and Testing

1. Allow the lifecycle management policy to run according to its schedule. After a few days, check the `data/reports` folder to see the updated access tiers for the blobs.
2. Verify the access tiers of the blobs using Azure Storage Explorer or the Azure Portal.

---

### Conclusion

In this lab, you learned how to automate Azure Blob Storage access tier management using lifecycle management rules. 
You implemented rules to change blob access tiers based on modification dates and filtered results for specific folder locations and CSV files. 
This approach helps optimize storage costs while ensuring that data is managed efficiently.
