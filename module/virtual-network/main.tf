provider "azurerm" {
    features {}
}

terraform {
    backend "azurerm" {}
}

resource "azurerm_virtual_network" "rollend-test-vm" {
    name = var.virtual_network_name
    location = var.location
    resource_group_name = var.resource_group_name
    address_space = ["10.0.0.0/16"]
    tags = {
        owner = "rollend"
    }
}