output "tls_private_key" { value = tls_private_key.example_ssh.private_key_pem }

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.confluent_alpha_vm.public_ip_address
}