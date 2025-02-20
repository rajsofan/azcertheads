variable "location" {
  description = "The location of the resource"

}
variable "azcertheadrgname" {
  description = "Name of the Resource group"
}

variable "vnet1name" {
  description = "Name of the Vnet1"
}

variable "vnet1addressSpace" {
  description = "Address Space for Vnet1"
}

variable "subnets" {
  type = map(any)
}

variable "availability_set_name" {
  type = string
}


variable "platform_fault_domain_count" {
  type = string
}

variable "platform_update_domain_count" {
  type = string
}


variable "avsetmanaged" {
  type = string
}

variable "ppg_name" {
  type = string
}

variable "vmname" {
  type = string
}

variable "ip_configuration_name" {
  type = string
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

variable "vm_size" {
  type = string

}


variable "storage_image_reference_publisher" {
  type = string
}

variable "storage_image_reference_offer" {
  type = string
}

variable "storage_image_reference_sku" {
  type = string
}

variable "storage_image_reference_version" {
  type = string
}

variable "vm_os_caching" {
  type = string
}

variable "vm_os_create_option" {
  type = string
}

variable "vm_os_managed_disk_type" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "vmcount" {
  description = "The number of virtual machines to create."
  type        = number

}


variable "managed_disk_count" {
  type = number
}

variable "datadisk_storage_account_type" {
  type = string
}


variable "disk_size_gb" {
  type = string
}

variable "vm_managed_disk_caching" {
  type = string
}


variable "computer_name" {
  type = string
}

//Bastion variables
variable "bastion_name" {
  type = string
}
variable "bastion_ipconfig_name" {
  type = string
}