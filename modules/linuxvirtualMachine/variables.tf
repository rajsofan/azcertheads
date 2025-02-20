
variable "vmcount" {
  type = number
}
variable "vmname" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "ip_configuration_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

variable "vm_size" {
  type = string

}

variable "proximity_placement_group_id" {
  type = string
}
variable "availability_set_id" {
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

variable "computer_name" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
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