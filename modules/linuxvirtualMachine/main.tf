resource "azurerm_network_interface" "labvmnic" {
  count               = var.vmcount
  name                = "${var.vmname}-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}


resource "azurerm_virtual_machine" "labazvm" {
  count                        = var.vmcount
  depends_on                   = [azurerm_network_interface.labvmnic]
  name                         = "${var.vmname}-vm-${count.index + 1}"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  network_interface_ids        = [azurerm_network_interface.labvmnic[count.index].id]
  vm_size                      = var.vm_size
  proximity_placement_group_id = var.proximity_placement_group_id
  availability_set_id          = var.availability_set_id

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.storage_image_reference_publisher
    offer     = var.storage_image_reference_offer
    sku       = var.storage_image_reference_sku
    version   = var.storage_image_reference_version
  }


  storage_os_disk {
    name              = "${var.vmname}-osdisk-${count.index + 1}"
    caching           = var.vm_os_caching
    create_option     = var.vm_os_create_option
    managed_disk_type = var.vm_os_managed_disk_type

  }

  os_profile {
    computer_name  = "${var.computer_name}-${count.index + 1}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

}


resource "azurerm_managed_disk" "azcertheadmanageddisk" {
  count                = var.vmcount * var.managed_disk_count
  name                 = "datadisk_${var.vmname}_${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.datadisk_storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb


}


resource "azurerm_virtual_machine_data_disk_attachment" "azcertheadattach" {
  count              = var.vmcount * var.managed_disk_count
  managed_disk_id    = azurerm_managed_disk.azcertheadmanageddisk[count.index].id
  virtual_machine_id = azurerm_virtual_machine.labazvm[count.index % var.vmcount].id
  lun                = count.index
  caching            = var.vm_managed_disk_caching
}












