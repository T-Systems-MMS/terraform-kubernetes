terraform {
  required_providers {
    azurerm = {
      source  = "registry.terraform.io/hashicorp/azurerm"
      version = "~>2.79"
    }
    kubernetes = {
      source  = "registry.terraform.io/hashicorp/kubernetes"
      version = "~>2.0"
    }
  }
  required_version = "~>1.0"
}
