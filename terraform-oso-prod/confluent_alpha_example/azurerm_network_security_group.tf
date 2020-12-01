# Create Network Security Group and rule
resource "azurerm_network_security_group" "confluent_security_group" {
  name                = "confluent-security-group"
  location            = azurerm_resource_group.confluent_resource_group.location
  resource_group_name = azurerm_resource_group.confluent_resource_group.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "confluent_sg_association" {
  network_interface_id      = azurerm_network_interface.confluent_network_interface.id
  network_security_group_id = azurerm_network_security_group.confluent_security_group.id
}