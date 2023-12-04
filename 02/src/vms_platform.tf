
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

