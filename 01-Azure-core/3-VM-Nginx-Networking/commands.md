## 1. Deploy Linux VM
```bash
az vm create \
  --resource-group MyResourceGroup \
  --name MyVM \
  --image Ubuntu2204 \
  --admin-username azureuser \
  --ssh-key-values ~/.ssh/id_ed25519.pub```

## 2. Connect via SSH
```bash
ssh -i ~/.ssh/id_ed25519 azureuser@<PUBLIC_IP>```

## 3. Install Azure CLI inside VM
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az --version```

## 4. Install and start Nginx
```bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx```
Verify locally:

```bash
curl localhost```

## 5. Access from browser
http://<PUBLIC_IP>

##6. Explore Networking
```bash
# Get NIC id
az vm show --resource-group MyResourceGroup --name MyVM \
  --query "networkProfile.networkInterfaces[0].id" -o tsv

# Show NIC details
az network nic show --ids <NIC_ID>

# Show VNet
az network vnet list --resource-group MyResourceGroup -o table

# Show Subnet
az network vnet subnet list --resource-group MyResourceGroup \
  --vnet-name <VNET_NAME> -o table```
