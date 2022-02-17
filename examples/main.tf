module "kubernetes" {
  source = "registry.terraform.io/T-Systems-MMS/kubernetes/kubernetes"
  kubernetes_namespace = {
    default = {
      metadata = {
        labels = {
          azure-key-vault-env-injection = "enabled"
        }
      }
    }
  }
}
