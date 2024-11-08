variable "location" {
  description = "The location of the resource"

}

variable "azcertheadrgname" {
  description = "Name of the Resource group"
  # default     = "azcertheadlab-rg01"

}

variable "vnet1name" {
  description = "Name of the Vnet1"
  # default     = "azvnet_lab01"

}

variable "vnet1addressSpace" {
  description = "Address Space for Vnet1"
}


variable "subnets" {
  type = map(any)

}




