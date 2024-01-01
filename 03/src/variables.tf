###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

# variable "security_group_id" {
#   type        = string
#   description = "yc vpc security-group list"
# }


variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_web_platform_id" {
  type        = string
  description = "platform ID for web"
  default     = "standard-v3"
}

variable "vm_web_image_family" {
   type        = string
   description = "YC image of VM system"
   default     = "ubuntu-2004-lts"
}

variable "vm_storage_platform_id" {
  type        = string
  description = "platform ID for storage"
  default     = "standard-v2"
}

