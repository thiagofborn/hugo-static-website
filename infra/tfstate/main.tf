# Specify the Azure provider and set authentication details
provider "azurerm" {
  features {}
}

# Define the resource group
resource "azurerm_resource_group" "example" {
  name     = "rg-${var.project}-${var.environment}-${var.team}"
  location = "westeurope"
  tags = {
    environment = "dev"
    team        = "Juliano and Thiago"
  }
}

# Define the storage account
resource "azurerm_storage_account" "example" {
  name                     = "tfstate${var.project}${var.environment}${var.team}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
    team        = "Juliano and Thiago"
  }
}

# Variables
variable "project" {
  type    = string
  default = "myproject"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "team" {
  type    = string
  default = "Juliano and Thiago"
}
