# Linux VM, Nginx, and Networking

## Overview
Practiced the following tasks step by step:

1. **Deploy a Linux VM (Ubuntu) in Azure**
   - Used Azure CLI in Cloud Shell to create a VM.
   - Generated VM credentials and obtained the public IP address.

2. **Connect to VM using SSH**
   - Logged into the VM from local machine with the SSH key.

3. **Install Azure CLI on VM (since `az` command was missing)**
   - Verified installation and tested `az` commands.

4. **Install Nginx inside the VM**
   - Updated packages, installed Nginx, and started the service.
   - Verified Nginx locally on the VM (`curl localhost`).

5. **Access Nginx from browser**
   - Opened the VM’s public IP in a browser and saw the default Nginx page.

6. **Explore networking configuration**
   - Listed the VM’s Network Interface, Virtual Network, and Subnet details.
   - Learned how resources are connected in Azure networking.

## Deliverables
- Step-by-step commands are saved in `commands.md`.
