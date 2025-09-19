#!/bin/bash
# Create Resource Group

RESOURCE_GROUP="MyResourceGroup"
LOCATION="westeurope"

echo "Creating Resource Group: $RESOURCE_GROUP in $LOCATION..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Listing resources in the Resource Group..."
az resource list --resource-group $RESOURCE_GROUP -o table

