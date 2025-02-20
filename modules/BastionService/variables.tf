//public IP variables

variable "location" {
  description = "The location of the resource"
  # default     = "uksouth"
}
variable "azcertheadrgname" {
  description = "Name of the Resource group"
  # default     = "azcertheadlab-rg01"
}
variable "pubipallocationmethod" {
  type    = string
  default = "Static"
}
variable "pubipsku" {
  type    = string
  default = "Standard"
}

//Bastion variables
variable "bastion_name" {
  type = string
}
variable "bastion_subnet_id" {
  type = string
}
variable "bastion_ipconfig_name" {
  type = string
}

