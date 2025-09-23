#!/usr/bin/env bash
set -euo pipefail

# -----------------------------
# Variables (update for your lab)
# -----------------------------
RG="<RESOURCE_GROUP>"       # e.g., my-rg
LOCATION="westeurope"
NSG_NAME="<NSG_NAME>"       # e.g., myvm-nsg
VM_NIC_ID="<NIC_NAME>"      # NIC to attach NSG to

# -----------------------------
# 1. Create NSG
# -----------------------------
az network nsg create \
  --resource-group "$RG" \
  --name "$NSG_NAME" \
  --location "$LOCATION"

# -----------------------------
# 2. Add inbound rules (SSH + HTTP)
# -----------------------------
az network nsg rule create \
  --resource-group "$RG" \
  --nsg-name "$NSG_NAME" \
  --name "Allow-SSH" \
  --priority 1000 \
  --protocol Tcp \
  --direction Inbound \
  --access Allow \
  --destination-port-range 22 \
  --source-address-prefix "*"

az network nsg rule create \
  --resource-group "$RG" \
  --nsg-name "$NSG_NAME" \
  --name "Allow-HTTP" \
  --priority 1010 \
  --protocol Tcp \
  --direction Inbound \
  --access Allow \
  --destination-port-range 80 \
  --source-address-prefix "*"

# -----------------------------
# 3. Attach NSG to NIC
# -----------------------------
az network nic update \
  --ids "$VM_NIC_ID" \
  --network-security-group "$NSG_NAME"

echo "NSG $NSG_NAME created and attached to NIC $VM_NIC_ID."

