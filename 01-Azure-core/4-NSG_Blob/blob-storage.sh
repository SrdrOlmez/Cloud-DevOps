#!/usr/bin/env bash
set -euo pipefail

# -----------------------------
# Variables (update for your lab)
# -----------------------------
RG="<RESOURCE_GROUP>"
ACCOUNT_NAME="<STORAGE_ACCOUNT_NAME>"
CONTAINER_NAME="<CONTAINER_NAME>"

# -----------------------------
# 1. Get storage account key
# -----------------------------
ACCOUNT_KEY=$(az storage account keys list \
  --resource-group "$RG" \
  --account-name "$ACCOUNT_NAME" \
  --query "[0].value" -o tsv)

# -----------------------------
# 2. Create container (if not exists)
# -----------------------------
az storage container create \
  --account-name "$ACCOUNT_NAME" \
  --name "$CONTAINER_NAME" \
  --account-key "$ACCOUNT_KEY"

# -----------------------------
# 3. Upload hello.txt
# -----------------------------
echo "Hello Azure Blob - <DATE>" > hello.txt

az storage blob upload \
  --account-name "$ACCOUNT_NAME" \
  --container-name "$CONTAINER_NAME" \
  --name "hello.txt" \
  --file "hello.txt" \
  --account-key "$ACCOUNT_KEY"

# -----------------------------
# 4. Download for verification
# -----------------------------
az storage blob download \
  --account-name "$ACCOUNT_NAME" \
  --container-name "$CONTAINER_NAME" \
  --name "hello.txt" \
  --file "hello_download.txt" \
  --account-key "$ACCOUNT_KEY"

echo "Downloaded file contents:"
cat hello_download.txt

# -----------------------------
# 5. Generate SAS URL (1 hour expiry)
# -----------------------------
SAS_TOKEN=$(az storage blob generate-sas \
  --account-name "$ACCOUNT_NAME" \
  --account-key "$ACCOUNT_KEY" \
  --container-name "$CONTAINER_NAME" \
  --name "hello.txt" \
  --permissions r \
  --expiry $(date -u -d "1 hour" '+%Y-%m-%dT%H:%MZ') \
  --https-only \
  -o tsv)

SAS_URL="https://${ACCOUNT_NAME}.blob.core.windows.net/${CONTAINER_NAME}/hello.txt?${SAS_TOKEN}"
echo "SAS URL: $SAS_URL"

# Optional: test download using curl
# curl "$SAS_URL"

