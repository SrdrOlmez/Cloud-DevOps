# Azure Learning Project

This repository contains scripts and documentation for learning Azure core services.

## Structure

- `Azure-core/`
  - `Create-resource-group/` → Scripts to create Resource Groups
  - `Entra-ID/` → Scripts to create Users, Groups, and assign RBAC roles
  - `VM-Nginx-Networking/` → Commands to create and manage VM, Nginx and Networking	
  - `NSG-Blob_Storage/` → Scripts, commands and templates 
- `AzureSQLMonitor/`→ Azure SQL database and Azure Alerts labs
- `azure-basic-web-infra/`→ Create a basic azure infrastructure
- `docker/` 
  - `basic-dockerile/`→ Create a basic dockerfile
  - `multistage-compose/`→ Create multistage dockerfile
- `README.md` files in each folder explain step-by-step instructions.

## Resource Group and Entra ID

- Create Resource Group using Bash scripts
- Learn Azure Entra ID: Users, Groups, RBAC
- Push scripts and documentation to GitHub

## VM, Nginx, Networking

- Deploy Linux VM, connect via SSH
- Install Nginx and azure CLI to VM
- Confirm webpage
- Explore Networking: VNet + Subnet

## Basic Web App Infrastructure on Azure

This lab demonstrates how to combine key Azure services into a small web application infrastructure:
- Virtual Machine (Ubuntu) with Nginx web server
- Virtual Network (VNet) and Subnet
- Network Security Group (NSG) with SSH and HTTP rules
- Azure Blob Storage for static files
- Upload/download verification with CLI
- SAS (Shared Access Signature) URL for secure access

## Azure SQL Database and azure monitor

- Created SQL server and configured firewall rule
- Connected with Azure Data Studio
- Ran CRUD queries on Students table

### Azure monitor

- Created a CPU usage alert on VM
- Tested CPU with stress tool and got CPU alert

## Azure basic web infrastructure

- Created Resource Group
- Networking: VNet + Subnet + NSG
- Deploy Linux VM + Install Web Server
- Blob Storage
- SQL Database
- Azure Monitor

## Docker

- Created a basic dockerfile
- Created multistage-dockerfile
- Created a yaml file
- Run & Test 




