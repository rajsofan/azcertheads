variable "location" {
  description = "The location of the resource"
  default     = "uksouth"
}

variable "azcertheadrgname" {
  description = "Name of the Resource group"
  default     = "azcertheadlab-rg01"

}

variable "vnet1name" {
  description = "Name of the Vnet1"
  default     = "azvnet_lab01"

}

variable "vnet1addressSpace" {
  description = "Address Space for Vnet1"
  default     = ["192.168.0.0/24"]

}


variable "subnets" {
  type = map(any)
  default = {
    subnet1 = {
      name = "workloadsubnet"
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
}

 

