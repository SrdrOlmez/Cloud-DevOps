terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

# Resource Group creation
resource "local_file" "resource_group" {
  content  = "Simulating Azure Resource Group: myResourceGroup"
  filename = "${path.module}/resource_group.txt"
}

# Virtual Machine
resource "local_file" "virtual_machine" {
  content  = "Simulating Azure VM: myVM in Resource Group: myResourceGroup"
  filename = "${path.module}/vm.txt"
}

