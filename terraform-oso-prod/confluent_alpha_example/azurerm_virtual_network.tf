# Create network interface
resource "azurerm_network_interface" "confluent_network_interface" {
  name = "confluent-eni"
  location = data.azurerm_resource_group.confluent_resource_group.location
  resource_group_name = data.azurerm_resource_group.confluent_resource_group.name

  ip_configuration {
    name = "myNicConfiguration"
    subnet_id = data.azurerm_subnet.confluent_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.confluent_public_ip.id
  }

  tags = {
    environment = "Terraform Demo"
  }
}

resource "azurerm_public_ip" "confluent_public_ip" {
  name                         = "confluent-public-ip"
  location                     = data.azurerm_resource_group.confluent_resource_group.location
  resource_group_name          = data.azurerm_resource_group.confluent_resource_group.name
  allocation_method            = "Dynamic"

  tags = {
    environment = "Terraform Demo"
  }
}