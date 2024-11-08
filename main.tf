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

# //Create Subnets

module "azcerheadsubnet" {
  source   = "./modules/subnets"
  vnetname = module.azcerheadvnet.vnetname
  vnetrg   = module.azcertheadrgcreate.resourcegroupname
  subnets  = var.subnets
  location = var.location

}
