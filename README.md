# Cloud/DevOps Learning Project

This repository contains scripts and documentation for learning Azure core services.

## Structure

- `01-Azure-core/`
  - `1-Create-resource-group/` → Scripts to create Resource Groups
  - `2-Entra-ID/` → Scripts to create Users, Groups, and assign RBAC roles
  - `3-VM-Nginx-Networking/` → Commands to create and manage VM, Nginx and Networking	
  - `4-NSG-Blob_Storage/` → Scripts, commands and templates 
- `02-AzureSQLMonitor/`→ Azure SQL database and Azure Alerts labs
- `03-Azure-basic-web-infra/`→ Create a basic azure infrastructure
- `04-Docker/` 
  - `1-Basic-dockerile/`→ Create a basic dockerfile
  - `2-Multistage-compose/`→ Create multistage dockerfile
  - `3-Docker-mini-project/`→ Create a basic docker project
- `05-Kubernetes/`
  - `1-Minikube/`→ Explore the basics of Kubernetes
  - `2-Dockerized-app/`→ Deploying a Dockerized app to Kubernetes
  - `3-YAML-Manifests/`→ Declerative configuration with YAML
- `06-ACR-AKS/`
  - `1-ACR/`→ Explore Azure container registry
  - `2-AKS/`→ Explore Azure Kubernetes service
  - `3-Mini-project/`→ ACR & AKS mini project
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

## Azure SQL Database and Azure Monitor

- Created SQL server and configured firewall rule
- Connected with Azure Data Studio
- Ran CRUD queries on Students table

### Azure monitor

- Created a CPU usage alert on VM
- Tested CPU with stress tool and got CPU alert

## Azure Basic Web Infrastructure

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

## Kubernetes

- Explored the basics of Kubernetes
- Deployed a Dockerized app to Kubernetes
- Practice declarative configuration with YAML
- Deployments for managing replicas and rollouts
- Services for stable networking and load balancing

## ACR & AKS(Local Simulation)

- Simulated AKS with Kind and ACR with local Docker registry
- Built, tagged, and pushed images (v1 → v2)
- Deployed app from local registry to Kind
- Tested rolling updates and verified zero downtime

