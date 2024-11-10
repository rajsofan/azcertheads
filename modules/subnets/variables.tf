variable "subnets" {
  type        = map(any)
  description = "Subnet Names and Prefixes"

}

variable "vnetrg" {
  type        = string
  description = "Resourcegroupname of the Vnet"

}

variable "vnetname" {
  type        = string
  description = "Name of the Vnet"

}

variable "location" {
  type        = string
  description = "Location of the Subnet"
}