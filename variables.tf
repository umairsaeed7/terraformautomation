variable "resource_group_name" {
  default = "rg-terraform-lab"
}

variable "location" {
  default = "East US 2"
}

variable "vm_size" {
  default = "Standard_DS1_v2"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  description = "VM admin password (injected from GitHub secret)"
  sensitive   = true
}
