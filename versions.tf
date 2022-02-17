terraform {
  required_providers {
    kubernetes = {
      source  = "registry.terraform.io/hashicorp/kubernetes"
      version = "~>2.0"
    }
  }
  required_version = "~>1.0"
}
