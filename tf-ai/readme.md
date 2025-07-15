# Azure AI Foundry Platform Module (AVM)

This module deploys the Azure AI Foundry platform using the AVM pattern.

## Overview
The AI Foundry module provisions a set of Azure resources to support enterprise-scale AI/ML workloads, including:
- Azure Machine Learning workspace
- Storage accounts
- Key Vault
- Networking resources
- Role assignments

## Required Variables
- `name` (string): The name prefix for deployed resources.
- `location` (string): The Azure region for deployment.
- `resource_group_name` (string): The resource group for all resources.
- `environment` (string): The environment name (e.g., `dev`, `prod`).
- `workload` (string): The workload name (e.g., `aiml`).

## Example Usage
```hcl
module "ai_foundry" {
  source              = "Azure/avm-ptn-aiml-ai-foundry/azurerm"
  version             = "0.2.0"
  name                = "myfoundry"
  location            = "eastus"
  resource_group_name = "my-rg"
  environment         = "dev"
  workload            = "aiml"
  # ...other optional variables...
}
```

## Documentation & Source
- [GitHub - Azure AI Foundry AVM Module](https://github.com/Azure/terraform-azurerm-avm-ptn-aiml-ai-foundry)
- [Module Documentation](https://github.com/Azure/terraform-azurerm-avm-ptn-aiml-ai-foundry/blob/v0.2.0/README.md)