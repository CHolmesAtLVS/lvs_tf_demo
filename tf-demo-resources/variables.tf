variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
  default     = "fd6fb306-2acd-4fae-a721-c8f5714b622e"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "caf1f457-d51b-4e2d-b243-4cef0766f9d1"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "tfstate-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "container_name" {
  description = "Storage container name"
  type        = string
  default     = "tfstate"
}
