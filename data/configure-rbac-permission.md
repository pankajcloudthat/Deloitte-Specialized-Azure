## Lab Instructions: Configuring RBAC Permissions for Azure Storage Account

In this lab, you will learn how to configure Role-Based Access Control (RBAC) permissions on an Azure Storage account. Specifically, you will create users and a security group in **Microsoft Entra ID** (formerly Azure AD), assign roles to control access to storage account blobs, and set permissions for both individual users and groups.

#### Lab Objectives:
- Create new users in Microsoft Entra ID (user1, user2, and user3).
- Create a security group in Entra ID and add users to the group.
- Assign **Storage Blob Data Contributor** permissions to user1.
- Assign **Storage Blob Data Reader** permissions to the security group.

---

### Prerequisites:
- An active Azure Subscription with permissions to manage users, groups, and roles.
- Access to the **Azure Portal**.

---

### Scenario:

Your organization has strict role-based access policies for data stored in Azure Blob Storage. You need to:
1. Create three new users in Microsoft Entra ID (user1, user2, and user3).
2. Create a new security group called `reader` and add user2 and user3 to it.
3. Assign **Storage Blob Data Contributor** permissions to user1 so they can upload, edit, and delete blobs.
4. Assign **Storage Blob Data Reader** permissions to the `reader` group, allowing user2 and user3 to view but not modify blob data.

---

### Steps:

#### 1. Create Users in Microsoft Entra ID

1. Navigate to **Azure Portal** and search for **Microsoft Entra ID** (formerly Azure Active Directory).
2. In the **Microsoft Entra ID** pane, select **Users** from the left-hand menu.
3. Click **+ New user** to create the first user (user1):
   - **User name**: `user1@yourdomain.onmicrosoft.com`
   - **Name**: Enter a suitable name (e.g., "User One").
   - **Password**: Auto-generate or manually set a password for user1. This password will need to be provided to the user for first-time login.
   - Click **Create**.

4. Repeat the process to create two more users (`user2` and `user3`):
   - **User name**: `user2@yourdomain.onmicrosoft.com` and `user3@yourdomain.onmicrosoft.com`
   - **Name**: "User Two" for user2 and "User Three" for user3.
   - **Password**: Auto-generate or manually set passwords for these users.
   - Click **Create** for each user.

#### 2. Create a Security Group and Add Users

1. In the **Microsoft Entra ID** pane, select **Groups** from the left-hand menu.
2. Click **+ New group** to create a new security group:
   - **Group type**: Select **Security**.
   - **Group name**: Enter `reader`.
   - **Group description**: Provide a description (e.g., "Group for storage blob data readers").
   - **Membership type**: Select **Assigned**.
   - Click **Create**.

3. Once the group is created, click on the **reader** group, and in the group overview, select **Members**.
4. Click **+ Add members** and search for `user2` and `user3`.
5. Select both users and click **Select** to add them to the group.

#### 3. Assign Storage Blob Data Contributor Role to user1

1. Navigate to your **Azure Storage account** in the Azure Portal.
2. In the **Storage account** pane, select **Access control (IAM)** from the left-hand menu.
3. Click **+ Add** and select **Add role assignment**.
4. In the **Role** dropdown, search for **Storage Blob Data Contributor** and select it. This role allows users to upload, delete, and modify blobs in the storage account.
5. In the **Members** tab, choose **Assign access to**: **User, group, or service principal**.
6. Click **+ Select members**, search for `user1`, and select it.
7. Click **Review + assign** to complete the role assignment.

#### 4. Assign Storage Blob Data Reader Role to the `reader` Group

1. In the same **Access control (IAM)** section of the Storage account, click **+ Add** and select **Add role assignment** again.
2. In the **Role** dropdown, search for **Storage Blob Data Reader** and select it. This role allows users to view blob data but not modify it.
3. In the **Members** tab, choose **Assign access to**: **User, group, or service principal**.
4. Click **+ Select members**, search for the **reader** group, and select it.
5. Click **Review + assign** to complete the role assignment.

#### 5. Verify Role Assignments

1. Navigate to the **Access control (IAM)** section of your storage account.
2. Under **Role assignments**, search for the users and group to verify that:
   - `user1` has the **Storage Blob Data Contributor** role.
   - The `reader` group (containing `user2` and `user3`) has the **Storage Blob Data Reader** role.

---

### Conclusion

In this lab, you learned how to manage access control for an Azure Storage account using RBAC. You created new users in Microsoft Entra ID, grouped users based on their roles, and assigned appropriate permissions to the storage account, enabling fine-grained control over data access.
