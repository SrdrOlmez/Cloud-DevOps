#!/bin/bash
# Dynamic Resource Group creation script

read -p "Enter Resource Group name: " RESOURCE_GROUP
read -p "Enter Azure region (e.g., westeurope, northeurope): " LOCATION

echo "Creating Resource Group '$RESOURCE_GROUP' in region '$LOCATION'..."
az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

echo "Listing resources in the Resource Group..."
az resource list --resource-group "$RESOURCE_GROUP" -o table

echo "✅ Resource Group '$RESOURCE_GROUP' created successfully!"

