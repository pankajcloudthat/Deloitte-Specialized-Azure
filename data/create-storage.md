## Lab: Create an Azure Blob Storage Account and Configure Anonymous Access

### Objective:
By the end of this lab, you will have:
- Created an Azure Blob Storage account with LRS redundancy.
- Enabled anonymous access on individual containers.
- Tested anonymous access for individual containers.

---

### Step 1: Create an Azure Storage Account

1. **Navigate to Azure Portal:**
   - Go to [Azure Portal](https://portal.azure.com/).
   - Sign in with your credentials.

2. **Create a Storage Account:**
   - In the left-hand menu, click on **"Create a resource"**.
   - In the search box, type **"Storage account"** and select it from the list.
   - Click **"Create"**.

3. **Configure Basic Settings:**
   - **Subscription:** Select your subscription.
   - **Resource Group:** Create a new one or select an existing one.
   - **Storage Account Name:** Enter a globally unique name for your storage account (e.g., `mystorageaccount123`).
   - **Region:** Choose a region closest to your users.
   - **Performance:** Leave it as **Standard**.
   - **Redundancy:** Select **Locally-redundant storage (LRS)**.

4. **Review and Create:**
   - Click on the **"Review + Create"** button.
   - Verify your selections and click **"Create"**.
   - Wait for the deployment to complete, then go to the resource once it's deployed.

---

### Step 2: Allow Anonymous Access for Individual Containers

1. **Navigate to Blob Service:**
   - In your storage account, under the **"Data storage"** section, click **"Containers"**.

2. **Create a Container:**
   - Click **"+ Container"**.
   - **Name:** Enter a unique name for the container (e.g., `mypubliccontainer`).
   - **Public Access Level:** Choose **"Container (anonymous read access to container and blobs)"**.
   - Click **"Create"**.

3. **Create Another Container for Restricted Access:**
   - Repeat the steps above to create a second container (e.g., `myprivatecontainer`), but set **Public Access Level** to **Private (no anonymous access)**.

---

### Step 3: Upload Blobs to Containers

1. **Upload a Blob to the Public Container:**
   - Select your **public container** (e.g., `mypubliccontainer`).
   - Click **"Upload"**.
   - Select a file from your local machine and click **"Upload"**.

2. **Upload a Blob to the Private Container:**
   - Repeat the above steps to upload a file to your **private container** (e.g., `myprivatecontainer`).

---

### Step 4: Test Anonymous Access

1. **Test Anonymous Access for the Public Container:**
   - In the Azure Portal, go to your **public container**.
   - Select the uploaded blob and click **"Properties"**.
   - Copy the **Blob URL**.
   - Open a new incognito/private browser window and paste the Blob URL.
   - You should be able to access the blob without signing in.

2. **Test Access for the Private Container:**
   - Now, navigate to your **private container** in the Azure Portal.
   - Select the blob in the private container, click **"Properties"**, and copy the Blob URL.
   - Open the Blob URL in a new incognito/private browser window.
   - This time, you should **not** be able to access the blob, and it should prompt you for credentials.

---

> ### Do not delete the storage account

---

### Conclusion:

You have successfully created an Azure Blob Storage account, enabled anonymous access for individual containers, and tested access to both public and private containers.
