terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
        }
    }
}
provider "azurerm" {
    features {}
    subscription_id = "bea2795f-924a-4033-a916-1c7b1713e1e3"
}