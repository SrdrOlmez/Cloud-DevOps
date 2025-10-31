# Azure VNet + Subnet + NSG with Terraform
VNet → Subnet → NSG → VM is the basic Azure networking pattern.
Terraform allows us to declare everything as code, so it's reproducible, version controlled, and shareable.

## What and Why

### Virtual Network (VNet)
A logical, isolated network in Azure, smilar to a private LAN in any on-prem environment.
- Isolates our resources (VMs, databases) from other tenants in Azure.
- Allows us to define private IP ranges.
- Enables communication between resources securely.

Note: A VNet has an address space, e.g, `10.0.0.0/16`. All subnets that creadted must fit inside this range.

### Subnet
A subdivision of a VNet. 
- Organize resources (web servers in one subnet, databases in another).
- Apply different network security rules per subnet.

A subnet has a smaller address range within the VNet,e.g.,`10.0.1.0/24`

### Network Security Group (NSG)
A set of firewall rules applied to VMs or subnets.
- Protects your resources by allowing/denying traffic.
For instance: Only allow SSH (port 22) for Linux VMs, block everything else.
Note: We define rules with priority, direction, port, protocol, and source/destination.

## Breaking Down main.tf 
```hcl
provider "azurerm" {
  features {}
}
```
- Connect Terraform to Azure.

- `features {}` is required by the provider (even if empty).

- In a live Azure environment, Terraform will look for credentials (via environment variables or Azure CLI). 

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "tf-network-rg"
  location = "West Europe"
}
```
- Resource Group: Container for all your Azure resources.

- Organizes resources, makes permissions and billing easier.

```hcl
resource "azurerm_virtual_network" "vnet" {
  name                = "tf-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
```
- VNet is our private network.

- `address_space = ["10.0.0.0/16"]` → allows 65,536 IP addresses inside.

- `location` and `resource_group_name` tie it to our RG

```hcl
resource "azurerm_subnet" "subnet" {
  name                 = "tf-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
```
- Subnet inside the VNet.

- `10.0.1.0/24` → allows 256 IP addresses for resources.

- Later, we can attach NSGs or route tables to this subnet.

```hcl
resource "azurerm_network_security_group" "nsg" {
  name                = "tf-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
```
NSG (Firewall rules):
- Allow inbound SSH on port 22 (for Linux VM access).
- `Priority 1001` → lower numbers have higher priority.
- Default rule: Azure blocks everything else if not allowed.

```hcl
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
```
- Associates NSG to the subnet.

- All VMs in this subnet will inherit the NSG rules automatically.

```hcl
output "subnet_id" {
  value = azurerm_subnet.subnet.id
}
```
- Prints the subnet ID after `terraform apply`.

- Useful if you want to reference this subnet in another Terraform module (like a VM or AKS cluster).
