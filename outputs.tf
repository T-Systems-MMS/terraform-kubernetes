output "namespace" {
  description = "kubernetes_namespace results"
  value = {
    for namespace in keys(kubernetes_namespace.namespace) :
    namespace => {
      metadata = kubernetes_namespace.namespace[namespace].metadata
    }
  }
}
