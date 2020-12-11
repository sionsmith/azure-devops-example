# Create virtual machine
resource "azurerm_linux_virtual_machine" "confluent_alpha_vm" {
  name                  = "${var.resource_group_name}-vm-01"
  location              = azurerm_resource_group.confluent_resource_group.location
  resource_group_name   = azurerm_resource_group.confluent_resource_group.name
  network_interface_ids = [azurerm_network_interface.confluent_network_interface.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name  = "${var.resource_group_name}-vm-01"
  admin_username = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username       = "azureuser"
    public_key     = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.confluent_stoage_block_1.primary_blob_endpoint

  }

  custom_data          = base64encode(data.template_file.script.rendered)

  lifecycle {
    ignore_changes = [tags]
  }
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "confluent_stoage_block_1" {
  name                        = var.storage_name
  resource_group_name         = azurerm_resource_group.confluent_resource_group.name
  location                    = azurerm_resource_group.confluent_resource_group.location
  account_tier                = "Standard"
  account_replication_type    = "LRS"

  lifecycle {
    ignore_changes = [tags]
  }
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.confluent_resource_group.name
  }

  byte_length = 8
}