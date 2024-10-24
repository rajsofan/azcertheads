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
    name             = "GatewaySubnet"
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
