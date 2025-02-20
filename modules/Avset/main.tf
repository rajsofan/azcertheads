resource "azurerm_availability_set" "azcerheadlabavset" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = var.azcertheadrgname
  managed                      = var.avsetmanaged
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  proximity_placement_group_id = var.proximity_placement_group_id

}