# Create virtual network
resource "azurerm_virtual_network" "confluent_network" {
  name                = "confluent-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.confluent_resource_group.location
  resource_group_name = azurerm_resource_group.confluent_resource_group.name

  tags = {
    environment = "Terraform Demo"
  }
}

# Create subnet
resource "azurerm_subnet" "confluent_subnet" {
  name                 = "confluent-subnet"
  resource_group_name  = azurerm_resource_group.confluent_resource_group.name
  virtual_network_name = azurerm_virtual_network.confluent_network.name
  address_prefixes       = ["10.0.1.0/24"]
}