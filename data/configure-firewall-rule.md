## Lab: Configure Azure Storage Firewalls and Virtual Networks to Restrict Blob Access

### Objective:
By the end of this lab, you will have:
- Configured Azure Storage firewalls and virtual networks.
- Restricted access to Azure Blob storage to only your current IP address.

---

### Prerequisites:
- You need to have an Azure Storage account already created. If not, follow the steps from the previous lab on creating an Azure Storage account.

---

### Step 1: Retrieve Your Current IP Address

1. **Get your current IP address:**
   - Open a browser and go to [WhatIsMyIP](https://www.whatismyip.com/).
   - Note down your **IPv4** address, as you will need this in the following steps.

---

### Step 2: Navigate to Your Storage Account

1. **Access Azure Portal:**
   - Go to [Azure Portal](https://portal.azure.com/).
   - Sign in with your Azure credentials.

2. **Open Storage Account:**
   - In the left-hand menu, select **"Storage accounts"**.
   - Find and click on the storage account you wish to configure (e.g., `mystorageaccount123`).

---

### Step 3: Configure Firewalls and Virtual Networks

1. **Access Networking Settings:**
   - In the storage account’s **"Settings"** section, click on **"Networking"**.

2. **Configure Firewall and Virtual Networks:**
   - Under the **"Firewall and virtual networks"** tab, you’ll see the following options:
     - **Allow access from:** Choose **"Selected networks"**.
     - Under **"Exceptions"**, uncheck **"Allow Azure services on the trusted services list to access this storage account"** if you want to block Azure services access.

3. **Add Your Current IP Address:**
   - In the **"Firewall"** section, click on **"+ Add your client IP"**.
   - This will automatically add your current IP address to the list of allowed IPs.
   
4. **Save the Configuration:**
   - After adding your IP, click **"Save"** at the top to apply the changes.

---

### Step 4: Test Blob Access from Your IP Address

1. **Upload a Blob to a Container:**
   - Navigate to the **"Containers"** section in your storage account (under **Data storage**).
   - Open an existing container or create a new one.
   - Upload a file (blob) to the container if none exist.

2. **Access the Blob:**
   - Copy the **Blob URL** for one of the blobs in the container.
   - Open the URL in a browser from your current IP (you should be able to access it).

---

### Step 5: Test Blob Access from a Different IP Address

1. **Simulate Access from a Different IP:**
   - To test restricted access, try to access the blob from a different network (such as using a mobile device on cellular data or a VPN).
   - Alternatively, use a different machine or ask a colleague/friend on another network to test the Blob URL.
   
2. **Expected Outcome:**
   - The access attempt should fail with a message like **"403 Forbidden"**, as the request is being made from an IP that is not allowed by the storage firewall.

---


> ### Do not delete the storage account

### Conclusion:

You have successfully configured Azure Storage firewalls to restrict access to your Blob storage account, allowing access only from your current IP address.
