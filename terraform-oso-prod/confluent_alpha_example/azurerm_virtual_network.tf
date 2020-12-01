# Create virtual network
//resource "azurerm_virtual_network" "confluent_network" {
//  name                = "confluent-network"
//  address_space       = ["10.0.0.0/16"]
//  location            = azurerm_resource_group.confluent_resource_group.location
//  resource_group_name = azurerm_resource_group.confluent_resource_group.name
//
//  tags = {
//    environment = "Terraform Demo"
//  }
//}

# Create subnet
//resource "azurerm_subnet" "confluent_subnet" {
//  name                 = "confluent-subnet"
//  resource_group_name  = azurerm_resource_group.confluent_resource_group.name
//  virtual_network_name = azurerm_virtual_network.confluent_network.name
//  address_prefixes       = ["10.0.1.0/24"]
//}

# Create public IPs
//resource "azurerm_public_ip" "confluent_public_ip" {
//  name                         = "confluent-public-ip"
//  location                     = azurerm_resource_group.confluent_resource_group.location
//  resource_group_name          = azurerm_resource_group.confluent_resource_group.name
//  allocation_method            = "Dynamic"
//
//  tags = {
//    environment = "Terraform Demo"
//  }
//}

# Create network interface
resource "azurerm_network_interface" "confluent_network_interface" {
  name = "confluent-eni"
  location = azurerm_resource_group.confluent_resource_group.location
  resource_group_name = azurerm_resource_group.confluent_resource_group.name

  ip_configuration {
    name = "myNicConfiguration"
    subnet_id = data.azurerm_subnet.confluent_subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "Terraform Demo"
  }
}