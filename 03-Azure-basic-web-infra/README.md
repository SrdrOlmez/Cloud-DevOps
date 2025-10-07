# Azure Mini Project

## Steps
1. Create Resource Group
2. Networking: VNet + Subnet + NSG
3. Deploy Linux VM + Install Web Server
4. Blob Storage
5. SQL Database
6. Azure Monitor

### 1. Create Resource Group
```bash
az group create --name rg-basic-infra --location uksouth
```
![azure resourge group created](screenshots/rg.jpg)

### 2. Networking: VNet + Subnet + NSG
```bash
az network vnet create \
  --resourcegroup rg-basic-infra \
  --name vnet-basic \
  --subnet-name subnet-basic \
  --location uksouth
```
![vnet-subnet created](screenshots/vnet.jpg)

SSH & HTTP Rules created

SSH rules
![ssh rule created](screenshots/ssh-rule.jpg)

HTTP rules
![http rule created](screenshots/http-rule.jpg)

### 3. Deploy Linux VM + Install Web Server
![VM created](screenshots/vm.jpg)
```
#Get public IP
az vm list-ip-addresses -g rg-basic-infra -n vm-basic -o table

#SSh into VM
ssh azureuser@<PUBLIC_IP>

#Inside VM - Install Nginx
sudo apt update && sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx 
```

Welcome to Nginx!
![Nginx on the explorer](screenshots/nginx.jpg)

### 4. Blob Storage
Create Storage Account

![blob storage account created](screenshots/storage-account.jpg)

Create Account Key

![account key created](screenshots/account-key.jpg)

Create storage container 

![Storage container created](screenshots/container-create.jpg)

Upload a test file

![Storage container created](screenshots/test-upload.jpg)

### 5. SQL Database
Create SQL server 

![SQL server created](screenshots/sql-server.jpg)

Create SQL database

![SQL database created](screenshots/sql-db.jpg)

Connected with Azure Data Studio

![Azure Data Studio CRUD queries](screenshots/crud-queries.jpg)

### 6. Azure Monitor
Enabled monitoring + alert rule for CPU > 75%

![monitor alert created](screenshots/monitor-alert.jpg)







