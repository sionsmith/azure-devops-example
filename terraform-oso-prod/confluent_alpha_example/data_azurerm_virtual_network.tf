data "azurerm_virtual_network" "confluent_network" {
  name = var.network_name
  resource_group_name = var.core_resource_group
}

data "azurerm_subnet" "confluent_subnet" {
  name = var.subnet_name
  resource_group_name = var.core_resource_group
  virtual_network_name = data.azurerm_virtual_network.confluent_network.name
}