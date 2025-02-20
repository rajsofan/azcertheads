location          = "uksouth" // Location of the deployment
azcertheadrgname  = "azcertheadlab-rg01"
vnet1addressSpace = ["192.168.0.0/24"]
vnet1name         = "azvnet_lab01"
subnets = {
  subnet1 = {
    name             = "workloadsubnet"
    address_prefixes = ["192.168.0.0/26"]
  }
  subnet2 = {
    name             = "AzureBastionSubnet"
    address_prefixes = ["192.168.0.64/26"]
  }
  subnet3 = {
    name             = "AzureFirewallSubnetName"
    address_prefixes = ["192.168.0.128/26"]
  }
  subnet4 = {
    name             = "AzureFirewallManagementSubnet"
    address_prefixes = ["192.168.0.192/26"]
  }
}

// Proximity Placement Group values
ppg_name = "azlabppg01"

// Availability Set values
availability_set_name        = "azcertheadlabavset01"
platform_fault_domain_count  = "2"
platform_update_domain_count = "5"
avsetmanaged                 = "true"

//Virtual Machine values
vmcount                 = 2
vmname                  = "azcertheadlabvm"
ip_configuration_name   = "azcertheadipconfig01"
vm_os_caching           = "ReadWrite"
vm_os_create_option     = "FromImage"
vm_os_managed_disk_type = "Standard_LRS"
vm_managed_disk_caching = "ReadWrite"
vm_size                 = "Standard_D4s_v3"
//OS values
storage_image_reference_publisher = "suse"
storage_image_reference_offer     = "sles-15-sp5-sapcal"
storage_image_reference_sku       = "gen2"
storage_image_reference_version   = "latest"
// Machine values
computer_name  = "azcertheadlabvm1"
admin_username = "adminuser"
admin_password = "Welcome@12345678"
// Data Disks values
datadisk_storage_account_type = "Premium_LRS"
disk_size_gb                  = "128"
managed_disk_count            = "7"

//Bastion Values
bastion_name          = "azcertheadbastion"
bastion_ipconfig_name = "azcertheadbastionipconfig"
