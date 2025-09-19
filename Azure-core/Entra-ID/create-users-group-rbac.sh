#!/bin/bash
# Azure Entra ID: Users, Groups, RBAC script (CLI 2025 compatible)
# Replace <your_verified_domain> with your tenant's verified domain

# Variables
GROUP_NAME="DevTeam"
USER_NAME="Alice"
USER_UPN="alice@<your_verified_domain>.onmicrosoft.com"  # replace with your tenant domain
TEMP_PASSWORD="TempP@ss123!"
RESOURCE_GROUP="DevProjects"
ROLE="Reader"

# 1. Create group (if it exists, continue)
echo "Creating group: $GROUP_NAME"
az ad group create --display-name "$GROUP_NAME" --mail-nickname "$GROUP_NAME" 2>/dev/null || echo "Group already exists, continuing..."

# 2. Create user (if it exists, continue)
echo "Creating user: $USER_UPN"
az ad user create \
  --display-name "$USER_NAME" \
  --user-principal-name "$USER_UPN" \
  --password "$TEMP_PASSWORD" 2>/dev/null || echo "User may already exist, continuing..."

# 3. Get user objectId
USER_ID=$(az ad user show --id "$USER_UPN" --query id -o tsv)
if [ -z "$USER_ID" ]; then
    echo "Error: User objectId not found. Check if the UPN/domain is correct."
    exit 1
fi
echo "User objectId: $USER_ID"

# 4. Add user to group
echo "Adding $USER_UPN to group $GROUP_NAME"
az ad group member add --group "$GROUP_NAME" --member-id "$USER_ID" 2>/dev/null || echo "User may already be in group, continuing..."

# 5. Get Resource Group ID
RG_ID=$(az group show --name "$RESOURCE_GROUP" --query id -o tsv)
if [ -z "$RG_ID" ]; then
    echo "Error: Resource Group '$RESOURCE_GROUP' not found. Create it first."
    exit 1
fi

# 6. Assign role
echo "Assigning role $ROLE to group $GROUP_NAME on resource group $RESOURCE_GROUP"
az role assignment create --assignee "$GROUP_NAME" --role "$ROLE" --scope "$RG_ID" 2>/dev/null || echo "Role may already be assigned, continuing..."

echo "Users, Groups, and RBAC setup complete."

