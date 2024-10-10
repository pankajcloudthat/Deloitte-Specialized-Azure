## Lab: Configuring Shared Access Signatures (SAS) for Azure Storage

In this lab, you will create and configure different types of **Shared Access Signatures (SAS)** for an Azure Storage account. These include:

1. Creating an **Account SAS** to provide access to the entire storage account.
2. Creating a **Service SAS** for granular access to a specific container.
3. Creating a **User Delegation SAS** using Entra ID (Azure AD).
4. Creating a **Stored Access Policy** to centrally manage SAS tokens for a container.

### Lab Objectives:
- Learn how to configure different SAS types to control access to Azure Storage resources.
- Understand how to secure access by specifying permissions, time limits, and IP restrictions.

---

### Prerequisites:
- You must have an existing **Azure Storage account**.
- Access to the Azure Portal.
- Basic understanding of storage containers and Azure Active Directory (Entra ID).

---

### Scenario:

Your organization needs to provide secure access to Azure Storage resources without exposing storage account keys. You will use **Shared Access Signatures (SAS)** to give limited, time-bound access while maintaining control over what actions users can perform.

---

## Instructions:

---

### Step 1: Create an Account SAS

**Account SAS** grants access to services across the entire Azure Storage account (e.g., blobs, files, queues, tables). It is used when you want to provide access at the storage account level.

1. **Navigate to Azure Portal**:
   - Log into the **Azure Portal**.
   - Go to your **Storage Account**.
   
2. **Access SAS settings**:
   - In the **Storage account overview**, find and click on **Shared access signature** in the left-hand menu.

3. **Configure Account SAS**:
   - Under **Allowed services**, select the services you want to include in the SAS. For example:
     - **Blob**, **File**, **Queue**, and **Table** (depending on your use case).
   - Under **Allowed resource types**, select:
     - **Service**: Provides access to the services within the account.
     - **Container**: Provides access to the containers, file shares, etc.
     - **Object**: Provides access to specific objects like blobs, files, or messages.
   - Under **Allowed permissions**, select the permissions you want to grant:
     - Example: **Read**, **Write**, **Delete**, **List**.
   - Optionally, define **Allowed IP addresses** to restrict access by specific IPs.
   - Under **Allowed protocols**, choose **HTTPS only** to ensure secure access.

4. **Define the SAS validity period**:
   - Set the **Start time** and **Expiry time** to control when the SAS becomes valid and when it will expire.
     - Example: Start time as now and expire after a day or week depending on your needs.

5. **Generate the SAS**:
   - Once you have configured the required options, click **Generate SAS and connection string**.
   - The portal will display the **SAS token** and **Connection string**.
   - **Copy the SAS token** or **connection string** to use it in your applications.

---

### Step 2: Create a Service SAS on a Container

A **Service SAS** grants granular access to a specific resource within a service, such as a blob container.

1. **Navigate to Containers**:
   - In your storage account, select **Containers** under **Blob service** from the left-hand menu.

2. **Choose a container**:
   - Select a container you wish to create a Service SAS for (e.g., `project-files`).

3. **Generate SAS for the container**:
   - Click on the **container name** to open it.
   - In the top menu, click **Generate SAS**.

4. **Set the SAS permissions**:
   - Select the **Permissions** you want to grant for this container:
     - **Read**: Allows reading the blobs.
     - **Write**: Allows uploading or modifying blobs.
     - **Delete**: Allows deletion of blobs.
     - **List**: Allows listing the blobs in the container.
   - Set the **Start and Expiry time** for the SAS.
   - Optionally, specify **Allowed IP addresses** to limit access from certain networks.
   - Choose **Allowed protocols** as **HTTPS only** for secure access.

5. **Generate the Service SAS**:
   - Click **Generate SAS token and URL**.
   - Copy the **SAS token** or **URL**. This token can be shared with others to grant them temporary access to the container.

---

### Step 3: Create a User Delegation SAS with Entra ID

A **User Delegation SAS** leverages Azure AD (Entra ID) for identity-based access control. It provides finer security by associating access with Azure AD users.

1. **Ensure Azure AD integration**:
   - Before generating a User Delegation SAS, ensure that your storage account is configured to use **Azure Active Directory (Azure AD)** for authentication.
   - To check this:
     - Go to your **Storage account**.
     - Under the **Settings** section, click **Configuration**.
     - Ensure **Azure Active Directory integration** is enabled.

2. **Navigate to Blob Containers**:
   - In the storage account, go to **Containers** under the **Blob service** section.
   - Select the container you want to secure with a User Delegation SAS (e.g., `user-files`).

3. **Generate a User Delegation SAS**:
   - Select the container and click **Generate SAS** from the top menu.
   - Choose the **User Delegation SAS** option.

4. **Configure SAS options**:
   - Set the **Permissions** for the SAS (e.g., **Read**, **Write**, **Delete**, **List**).
   - Set the **Start and Expiry time** to define the SAS validity.
   - The **User delegation key** will be automatically generated using your Azure AD identity.

5. **Generate and copy the SAS**:
   - Click **Generate SAS token and URL**.
   - Copy the **SAS token** or **URL** to provide secure access to the container. Only Azure AD authenticated users will be able to use the SAS for access.

---

### Step 4: Create a Stored Access Policy

A **Stored Access Policy** allows you to create a reusable policy that governs SAS tokens at the container level. SAS tokens tied to a stored access policy inherit its permissions and time limits.

1. **Navigate to the container**:
   - Go to **Containers** in the **Blob service** section.
   - Select the container you wish to apply the policy to (e.g., `audit-logs`).

2. **Create an Access Policy**:
   - In the container pane, click **Access policy** from the top menu.
   - Click **+ Add policy** to create a new access policy.

3. **Set the policy options**:
   - **Policy Name**: Enter a meaningful name (e.g., `read-only-policy`).
   - **Start and Expiry time**: Set the start and expiry time for the policy to control its validity.
   - **Permissions**: Choose the permissions granted by the policy (e.g., **Read**, **List**).

4. **Save the Policy**:
   - Click **OK** to create and save the policy.

5. **Generate SAS linked to the stored policy**:
   - To create a SAS token tied to this policy:
     - Navigate to a blob within the container.
     - Select **Generate SAS** and choose the **Stored Access Policy** you just created.
   - Generate the SAS token and copy it for sharing.
   - This SAS will be governed by the rules of the stored access policy, making it easier to centrally manage and revoke access when needed.

---

### Conclusion:

In this lab, you learned how to create and manage various types of **Shared Access Signatures (SAS)** in Azure Storage. You created an **Account SAS** for account-wide access, a **Service SAS** for container-level access, a **User Delegation SAS** for secure, identity-based access using Azure AD, and a **Stored Access Policy** to centrally manage SAS tokens. Each type of SAS allows you to provide secure, time-bound access to storage resources while maintaining granular control over what actions users can perform.
