
variable "vm_web_image_family" {
   type        = string
   description = "YC image of VM system"
   default     = "ubuntu-2004-lts"
}

variable "vm_web_instance_name" {
   type        = string
   description = "Instance name"
   default     = "netology-develop-platform-web"
}


variable "vm_db_image_family" {
  type        = string
  description = "YC image of VM system"
  default     = "ubuntu-2004-lts"
}
 
variable "vm_db_instance_name" {
  type        = string
  description = "Instance name"
  default     = "netology-develop-platform-db"
}


variable "vm_web_cores" {
  type        = number
  description = "Number of cores for the web VM"
  default     = 2 
}

variable "vm_web_memory" {
  type        = number
  description = "Amount of memory for the web VM"
  default     = 1
}

variable "vm_web_core_fraction" {
  type        = number
  description = "Core fraction for the web VM"
  default     = 20 
}


variable "vm_db_cores" {
  type        = number
  description = "Number of cores for the web VM"
  default     = 2
}

variable "vm_db_memory" {
  type        = number
  description = "Amount of memory for the web VM"
  default     = 4
}

variable "vm_db_core_fraction" {
  type        = number
  description = "Core fraction for the web VM"
  default     = 50
}

variable "vm_web_platform_id" {
  type        = string
  description = "platform ID for web"
  default     = "standard-v3"
}

variable "vm_db_platform_id" {
  type        = string
  description = "platform ID for web"
  default     = "standard-v2"
}

