variable "kubernetes_service_account" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "kubernetes_cluster_role_binding" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "kubernetes_namespace" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "kubernetes_secret" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "kubernetes_config_map" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    kubernetes_service_account = {
      metadata = {
        name          = ""
        namespace     = "kube-system"
        annotations   = null
        generate_name = null
        labels        = null
      }
      automount_service_account_token = true
    }
    kubernetes_cluster_role_binding = {
      metadata = {
        name = ""
      }
      role_ref = {
        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = "cluster-admin"
      }
      subject = {
        kind      = "ServiceAccount"
        namespace = "kube-system"
      }
    }
    kubernetes_namespace = {
      metadata = {
        name          = ""
        annotations   = null
        generate_name = null
        labels        = null
      }
    }
    kubernetes_secret = {
      metadata = {
        name          = ""
        namespace     = null
        annotations   = null
        generate_name = null
        labels        = null
      }
      data        = null
      binary_data = null
      type        = null
      immutable   = null
    }
    kubernetes_config_map = {
      metadata = {
        name          = ""
        namespace     = null
        annotations   = null
        generate_name = null
        labels        = null
      }
      data        = null
      binary_data = null
    }
  }

  # compare and merge custom and default values
  kubernetes_service_account_values = {
    for kubernetes_service_account in keys(var.kubernetes_service_account) :
    kubernetes_service_account => merge(local.default.kubernetes_service_account, var.kubernetes_service_account[kubernetes_service_account])
  }
  kubernetes_cluster_role_binding_values = {
    for kubernetes_cluster_role_binding in keys(var.kubernetes_cluster_role_binding) :
    kubernetes_cluster_role_binding => merge(local.default.kubernetes_cluster_role_binding, var.kubernetes_cluster_role_binding[kubernetes_cluster_role_binding])
  }
  kubernetes_namespace_values = {
    for kubernetes_namespace in keys(var.kubernetes_namespace) :
    kubernetes_namespace => merge(local.default.kubernetes_namespace, var.kubernetes_namespace[kubernetes_namespace])
  }
  kubernetes_secret_values = {
    for kubernetes_secret in keys(var.kubernetes_secret) :
    kubernetes_secret => merge(local.default.kubernetes_secret, var.kubernetes_secret[kubernetes_secret])
  }
  kubernetes_config_map_values = {
    for kubernetes_config_map in keys(var.kubernetes_config_map) :
    kubernetes_config_map => merge(local.default.kubernetes_config_map, var.kubernetes_config_map[kubernetes_config_map])
  }

  # merge all custom and default values
  kubernetes_service_account = {
    for kubernetes_service_account in keys(var.kubernetes_service_account) :
    kubernetes_service_account => merge(
      local.kubernetes_service_account_values[kubernetes_service_account],
      {
        for config in ["metadata"] :
        config => merge(local.default.kubernetes_service_account[config], local.kubernetes_service_account_values[kubernetes_service_account][config])
      }
    )
  }
  kubernetes_cluster_role_binding = {
    for kubernetes_cluster_role_binding in keys(var.kubernetes_cluster_role_binding) :
    kubernetes_cluster_role_binding => merge(
      local.kubernetes_cluster_role_binding_values[kubernetes_cluster_role_binding],
      {
        for config in ["metadata", "role_ref", "subject"] :
        config => merge(local.default.kubernetes_cluster_role_binding[config], local.kubernetes_cluster_role_binding_values[kubernetes_cluster_role_binding][config])
      }
    )
  }
  kubernetes_namespace = {
    for kubernetes_namespace in keys(var.kubernetes_namespace) :
    kubernetes_namespace => merge(
      local.kubernetes_namespace_values[kubernetes_namespace],
      {
        for config in ["metadata"] :
        config => merge(local.default.kubernetes_namespace[config], local.kubernetes_namespace_values[kubernetes_namespace][config])
      }
    )
  }
  kubernetes_secret = {
    for kubernetes_secret in keys(var.kubernetes_secret) :
    kubernetes_secret => merge(
      local.kubernetes_secret_values[kubernetes_secret],
      {
        for config in ["metadata"] :
        config => merge(local.default.kubernetes_secret[config], local.kubernetes_secret_values[kubernetes_secret][config])
      }
    )
  }
  kubernetes_config_map = {
    for kubernetes_config_map in keys(var.kubernetes_config_map) :
    kubernetes_config_map => merge(
      local.kubernetes_config_map_values[kubernetes_config_map],
      {
        for config in ["metadata"] :
        config => merge(local.default.kubernetes_config_map[config], local.kubernetes_config_map_values[kubernetes_config_map][config])
      }
    )
  }
}
