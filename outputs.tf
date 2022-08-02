output "namespace" {
  description = "kubernetes_namespace results"
  value = {
    for namespace in keys(kubernetes_namespace.namespace) :
    namespace => {
      metadata = kubernetes_namespace.namespace[namespace].metadata
    }
  }
}

output "storage_class" {
  description = "kubernetes_storage_class results"
  value = {
    for storage_class in keys(kubernetes_storage_class.storage_class) :
    storage_class => {
      metadata = kubernetes_storage_class.storage_class[storage_class].metadata
    }
  }
}
