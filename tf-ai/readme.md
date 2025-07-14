# Azure Cognitive Services Account Deployment (AVM Module)

This module deploys an Azure Cognitive Services account using the AVM module.

## Required Variables
- `name` (string): The name of the Cognitive Services account.
- `location` (string): The Azure region where the resource will be deployed.
- `resource_group_name` (string): The name of the resource group to contain the account.
- `kind` (string): The type of Cognitive Services account (e.g., `OpenAI`).
- `sku_name` (string): The SKU name for the account (e.g., `S0`).

## Example Usage
```hcl
module "avm-res-cognitiveservices-account" {
  source              = "Azure/avm-res-cognitiveservices-account/azurerm"
  version             = "0.7.1"
  name                = "<account_name>"
  location            = "<azure_region>"
  resource_group_name = "<resource_group>"
  kind                = "OpenAI"
  sku_name            = "S0"
}
```

## Source Repository

[GitHub - Azure Cognitive Services Account AVM Module](https://github.com/Azure/terraform-azurerm-avm-res-cognitiveservices-account)