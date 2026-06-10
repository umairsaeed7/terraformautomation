variable "resource_group_name" {
  default = "rg-terraform-lab"
}

variable "location" {
  default = "East US 3"
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "azureuser"
}

variable "admin_password" {
  description = "VM admin password (injected from GitHub secret)"
  sensitive   = true
}
