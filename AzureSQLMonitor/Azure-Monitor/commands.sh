#!/bin/bash

# ===============================
# Azure Monitor Lab Script
# ===============================

# This script automates the following:
# - Resource Group creation
# - Ubuntu VM deployment
# - Opening SSH and HTTP ports
# - Creating an Action Group
# - Creating a CPU alert

# -------------------------------
# 1. Create Resource Group
# -------------------------------
echo "Creating resource group..."
az group create --name MyResourceGroup --location uksouth

# -------------------------------
# 2. Deploy Ubuntu VM
# -------------------------------
echo "Deploying Ubuntu VM..."
az vm create \
  --resource-group MyResourceGroup \
  --name MyVM \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --location uksouth \
  --admin-username azureuser \
  --generate-ssh-keys

# -------------------------------
# 3. Open SSH (22) and HTTP (80) Ports
# -------------------------------
echo "Opening ports..."
az vm open-port --port 22 --resource-group MyResourceGroup --name MyVM
az vm open-port --port 80 --resource-group MyResourceGroup --name MyVM --priority 101

# -------------------------------
# 4. Create Action Group
# -------------------------------
# Note: Replace your-email@example.com with a valid email address
echo "Creating Action Group..."
az monitor action-group create \
  --resource-group MyResourceGroup \
  --name MyActionGroup \
  --short-name MAG \
  --location global \
  --action email AlertNotify your-email@example.com

# -------------------------------
# 5. Create CPU Alert
# -------------------------------
echo "Creating CPU alert..."
VM_ID=$(az vm show -g MyResourceGroup -n MyVM --query id -o tsv)

az monitor metrics alert create \
  --name "HighCPUAlert" \
  --resource-group MyResourceGroup \
  --scopes $VM_ID \
  --condition "avg Percentage CPU > 75" \
  --description "Alert if CPU > 75%" \
  --action MyActionGroup

# -------------------------------
# 6. Instructions for Stress Test
# -------------------------------
echo "To test CPU alert, SSH into the VM and run:"
echo "ssh azureuser@<VM_PUBLIC_IP>"
echo "sudo apt update && sudo apt install stress -y"
echo "stress --cpu 2 --timeout 300"

echo "Script completed. Remember to monitor email notifications for alerts."

