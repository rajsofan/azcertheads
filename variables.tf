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

variable "workloadSubnetName" {
  description = "Workload Subnet Name"
  default     = "workloadsubnet"

}

variable "workloadSubneAddressSpace" {
  description = "Workload Subnet Address Space"
  default     = ["192.168.0.0/26"]

}

variable "GatewaySubnetName" {
  description = "Gateway Subnet Name"
  default     = "GatewaySubnet"

}

variable "GatewaySubnetNameAddressSpace" {
  description = "Gateway Subnet Address Space"
  default     = ["192.168.0.64/26"]

}

variable "AzureFirewallSubnetName" {
  description = "Name of the Azure FirewallSubnet"
  default     = "AzureFirewallSubnet"

}

variable "AzureFirewallSubnetAddressSpace" {
  description = "Address Space of AzureFirewall Subnet"
  default     = ["192.168.0.128/26"]

}


variable "AzureFirewallManagmentSubnetName" {
  description = "Name of the Azure Firewall Managment Subnet"
  default     = "AzureFirewallManagementSubnet"

}

variable "AzureFirewallManagmentSubnetAddressSpace" {
  description = "Address Space of AzureFirewall Managment Subnet"
  default     = ["192.168.0.192/26"]

}