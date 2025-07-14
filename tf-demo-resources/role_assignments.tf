# Get the Azure AD users for the owners of the resource groups.  Need to use the user principal name to get the object ID.
data "azuread_user" "owner" {
  for_each = local.rg_owners
  user_principal_name = each.value
}

# Assign the Owner role to the Azure AD users for the resource groups.
resource "azurerm_role_assignment" "owner" {
  for_each             = local.rg_owners
  scope                = azurerm_resource_group.owner_rg[each.key].id
  role_definition_name = "Owner"
  principal_id         = data.azuread_user.owner[each.key].object_id
}

# Assign the Storage Account Contributor role to the Azure AD users for the resource groups.
resource "azurerm_role_assignment" "state_rg_owner" {
  for_each             = local.rg_owners
  scope                = azurerm_resource_group.tfstate.id
  role_definition_name = "Owner"
  principal_id         = data.azuread_user.owner[each.key].object_id
}

# Assign the Storage Account Contributor role to the Azure AD users for the storage account.
resource "azurerm_role_assignment" "state_sa_contributor" {
  for_each             = local.rg_owners
  scope                = azurerm_storage_account.tfstate.id
  role_definition_name = "Storage Account Contributor"
  principal_id         = data.azuread_user.owner[each.key].object_id
}
