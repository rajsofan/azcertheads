//Create a resource group for the lab

module "azcertheadrgcreate" {
  source           = "./modules/resourcegroup"
  location         = var.location
  azcertheadrgname = var.azcertheadrgname

}


//Create the VNet

module "azcerheadvnet" {
  source            = "./modules/vnet"
  vnet1name         = var.vnet1name
  vnet1addressSpace = var.vnet1addressSpace
  location          = var.location
  vnetrg            = module.azcertheadrgcreate.resourcegroupname

}



//Create Subnets

module "azcerheadsubnet" {
  source   = "./modules/subnets"
  vnetname = module.azcerheadvnet.vnetname
  vnetrg   = module.azcertheadrgcreate.resourcegroupname
  subnets  = var.subnets
  location = var.location

}

data "azurerm_subnet" "workloadsubnetid" {
  depends_on           = [module.azcerheadsubnet]
  name                 = "workloadsubnet"
  virtual_network_name = module.azcerheadvnet.vnetname
  resource_group_name  = module.azcertheadrgcreate.resourcegroupname
}

data "azurerm_subnet" "bastionsubneid" {
  depends_on           = [module.azcerheadsubnet]
  name                 = "AzureBastionSubnet"
  virtual_network_name = module.azcerheadvnet.vnetname
  resource_group_name  = module.azcertheadrgcreate.resourcegroupname
}

// Create the Proximity Placement group

module "azlabppg" {
  source              = "./modules/ProximityPlacementGroup"
  ppg_name            = var.ppg_name
  location            = var.location
  resource_group_name = module.azcertheadrgcreate.resourcegroupname
}




//Create Availability Set

module "azcerheadlabavset" {
  depends_on                   = [module.azlabppg]
  source                       = "./modules/Avset"
  availability_set_name        = var.availability_set_name
  location                     = var.location
  azcertheadrgname             = module.azcertheadrgcreate.resourcegroupname
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  avsetmanaged                 = var.avsetmanaged
  proximity_placement_group_id = module.azlabppg.azlabppgid

}


//Create Virtual Machine

module "azcerthadlabVM" {
  source                            = "./modules/linuxvirtualMachine"
  resource_group_name               = module.azcertheadrgcreate.resourcegroupname
  vmname                            = var.vmname
  vmcount                           = var.vmcount
  availability_set_id               = module.azcerheadlabavset.availability_set_id
  proximity_placement_group_id      = module.azlabppg.azlabppgid
  location                          = var.location
  ip_configuration_name             = var.ip_configuration_name
  subnet_id                         = data.azurerm_subnet.workloadsubnetid.id
  computer_name                     = var.computer_name
  private_ip_address_allocation     = var.private_ip_address_allocation
  vm_size                           = var.vm_size
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  managed_disk_count                = var.managed_disk_count
  datadisk_storage_account_type     = var.datadisk_storage_account_type
  admin_password                    = var.admin_password
  admin_username                    = var.admin_username
  vm_os_caching                     = var.vm_os_caching
  vm_managed_disk_caching           = var.vm_managed_disk_caching
  vm_os_create_option               = var.vm_os_create_option
  vm_os_managed_disk_type           = var.vm_os_managed_disk_type
  disk_size_gb                      = var.disk_size_gb
}


//Deploy Azure Bastion Host
module "azlab-bastion" {
  source                = "./modules/BastionService"
  depends_on            = [module.azcerheadvnet]
  location              = var.location
  azcertheadrgname      = module.azcertheadrgcreate.resourcegroupname
  bastion_name          = var.bastion_name
  bastion_ipconfig_name = var.bastion_ipconfig_name
  bastion_subnet_id     = data.azurerm_subnet.bastionsubneid.id
}