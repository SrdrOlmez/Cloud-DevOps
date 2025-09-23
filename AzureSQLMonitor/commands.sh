#!/bin/bash

# Login
az login --use-device-code

# Create resource group
az group create --name sql-lab-rg --location westeurope

# Create SQL server
az sql server create \
  --name myazuresqlserver123 \
  --resource-group sql-lab-rg \
  --location westeurope \
  --admin-user azureuser \
  --admin-password "YourP@ssw0rd123!"

# Configure firewall
az sql server firewall-rule create \
  --resource-group sql-lab-rg \
  --server myazuresqlserver123 \
  --name AllowMyIP \
  --start-ip-address $(curl -s ifconfig.me) \
  --end-ip-address $(curl -s ifconfig.me)

# Create database
az sql db create \
  --resource-group sql-lab-rg \
  --server myazuresqlserver123 \
  --name sampledb \
  --service-objective S0

