terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "2714bf7a-4fd4-4386-a73d-5389d77f3bcc"
  client_id = "5ff12c62-cc1d-4e8f-8842-ce29af3c0d54"
  #client_secret = "SA58Q~RnOW_ASxepbItpmf_ACE1MN3vvDeta7c_7"
  tenant_id = "9b1a1349-3b6f-4753-afe9-96a7be1c0fea"
  features{}
}
variable "prefix" {
  default = "vmbyTerraform"
}

resource "azurerm_resource_group" "Dev0ps" {
  name     = "${var.prefix}-resources"
  location = "Central India"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.Dev0ps.location
  resource_group_name = azurerm_resource_group.Dev0ps.name
}

resource "azurerm_subnet" "subtf" {
  name                 = "subtf"
  resource_group_name  = azurerm_resource_group.Dev0ps.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.Dev0ps.location
  resource_group_name = azurerm_resource_group.Dev0ps.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subtf.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.Dev0ps.location
  resource_group_name   = azurerm_resource_group.Dev0ps.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "azureuser"
    admin_password = "Welcome@12345"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "testing"
  }
}