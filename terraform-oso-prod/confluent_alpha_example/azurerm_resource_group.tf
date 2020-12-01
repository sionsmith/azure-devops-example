resource "azurerm_resource_group" "confluent_resource_group" {
  name     = "confluent-alpha-example"
  location = "West Europe"

  lifecycle {
    ignore_changes = [tags]
  }

}