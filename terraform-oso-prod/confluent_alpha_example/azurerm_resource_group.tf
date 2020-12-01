resource "azurerm_resource_group" "confluent_resource_group" {
  name     = "confluent-alpha-example"
  location = "West Europe"

  tags = {
    environment = "Terraform Demo"
  }
}