provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "rg_example" {
  name = "example"
  location = "West Europe"
}