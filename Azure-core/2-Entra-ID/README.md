# Azure Entra ID Users/Groups/RBAC 

## Create Variables 
```bash
# Lab Variables
RESOURCE_GROUP="MyResourceGroup"
LOCATION="uksouth"
USER_NAME="azureuser"
USER_PRINCIPAL_NAME="${USER_NAME}@<yourtenant>.onmicrosoft.com"   # Replace <yourtenant>
USER_PASSWORD="P@ssw0rd123!"  
GROUP_NAME="Azure-group"
ROLE="Reader"   # Or Contributor etc.
```

## Create User in Entra ID
```bash
az ad user create \
  --display-name $USER_NAME \
  --user-principal-name $USER_PRINCIPAL_NAME \
  --password $USER_PASSWORD
```
![create variables and users](screenshots/user-bash.jpg)

