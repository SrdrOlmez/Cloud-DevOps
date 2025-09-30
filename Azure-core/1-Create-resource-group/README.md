# Create Resource Group

## Login
```bash
az login --use-device-code
```
![azure login](screenshots/az-login.jpg)


## Create Resource Group
```bash
az group create --name MyResourceGroup --location uksouth 
```
I use 'uksouth' as location because 'westeurope' servers are generally busy.
![create an azure resource group with bash](screenshots/rg-bash.jpg)
![azure resource group on azure portal](screenshots/rg-create.jpg)


