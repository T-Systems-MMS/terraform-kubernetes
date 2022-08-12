output "service" {
  description = "kubernetes_service results"
  value = {
    for service in keys(kubernetes_service.service) :
    service => {
      metadata = kubernetes_service.service[service].metadata
    }
  }
}

output "service_account" {
  description = "kubernetes_service_account results"
  value = {
    for service_account in keys(kubernetes_service_account.service_account) :
    service_account => {
      metadata = kubernetes_service_account.service_account[service_account].metadata
    }
  }
}

output "role_binding" {
  description = "kubernetes_role_binding results"
  value = {
    for role_binding in keys(kubernetes_role_binding.role_binding) :
    role_binding => {
      metadata = kubernetes_role_binding.role_binding[role_binding].metadata
    }
  }
}

output "cluster_role_binding" {
  description = "kubernetes_cluster_role_binding results"
  value = {
    for cluster_role_binding in keys(kubernetes_cluster_role_binding.cluster_role_binding) :
    cluster_role_binding => {
      metadata = kubernetes_cluster_role_binding.cluster_role_binding[cluster_role_binding].metadata
    }
  }
}

output "namespace" {
  description = "kubernetes_namespace results"
  value = {
    for namespace in keys(kubernetes_namespace.namespace) :
    namespace => {
      metadata = kubernetes_namespace.namespace[namespace].metadata
    }
  }
}

output "secret" {
  description = "kubernetes_secret results"
  value = {
    for secret in keys(kubernetes_secret.secret) :
    secret => {
      metadata = kubernetes_secret.secret[secret].metadata
    }
  }
}

output "config_map" {
  description = "kubernetes_config_map results"
  value = {
    for config_map in keys(kubernetes_config_map.config_map) :
    config_map => {
      metadata = kubernetes_config_map.config_map[config_map].metadata
      data     = kubernetes_config_map.config_map[config_map].data
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

output "persistent_volume_claim" {
  description = "kubernetes_persistent_volume_claim results"
  value = {
    for persistent_volume_claim in keys(kubernetes_persistent_volume_claim.persistent_volume_claim) :
    persistent_volume_claim => {
      metadata = kubernetes_persistent_volume_claim.persistent_volume_claim[persistent_volume_claim].metadata
    }
  }
}
