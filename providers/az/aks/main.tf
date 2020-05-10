provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.rg.name
  client_id           = var.service_principal_client_id
  client_secret       = var.service_principal_client_secret
  prefix              = var.aks_prefix
}

