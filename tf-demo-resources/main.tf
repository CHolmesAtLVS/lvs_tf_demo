# This Terraform configuration sets up Azure resources for managing state files and resource groups.
resource "azurerm_resource_group" "tfstate" {
  name     = var.resource_group_name
  location = var.location
}

# These RGs are working lab space.  Owners can create resources in these RGs.
resource "azurerm_resource_group" "owner_rg" {
  for_each = local.rg_owners
  name     = "${replace(each.key, "_", "-")}-rg"
  location = var.location
}

# This resource group is for the Terraform state file storage.
resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  blob_properties {
    versioning_enabled = true
  }
}

# This storage container is used to store the Terraform state files.
resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}

# This random integer is used to ensure unique names for the storage account.
resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}



