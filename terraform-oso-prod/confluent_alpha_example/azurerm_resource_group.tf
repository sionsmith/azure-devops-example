resource "azurerm_resource_group" "confluent_resource_group" {
  name     = var.resource_group_name
  location = "West Europe"

  lifecycle {
    ignore_changes = [tags]
  }
}