#!/bin/bash
# Azure Entra ID: Users, Groups, RBAC creation script

# Set variables
GROUP_NAME="DevOps-Team"
USER_NAME="testuser"
USER_UPN="testuser@yourtenant.onmicrosoft.com"
TEMP_PASSWORD="TempP@ssword123"
RESOURCE_GROUP="MyResourceGroup"
ROLE="Reader"

# Create group
echo "Creating group: $GROUP_NAME"
az ad group create --display-name "$GROUP_NAME" --mail-nickname "$GROUP_NAME"

# Create user
echo "Creating user: $USER_UPN"
az ad user create \
  --display-name "$USER_NAME" \
  --user-principal-name "$USER_UPN" \
  --password "$TEMP_PASSWORD" \
  --force-change-password-next-login true

# Add user to group
echo "Adding $USER_UPN to group $GROUP_NAME"
az ad group member add --group "$GROUP_NAME" --member-id "$USER_UPN"

# Assign role to group on Resource Group
echo "Assigning role $ROLE to group $GROUP_NAME on resource group $RESOURCE_GROUP"
az role assignment create --assignee "$GROUP_NAME" --role "$ROLE" --resource-group "$RESOURCE_GROUP"

echo "Users, Groups, and RBAC setup complete!"
