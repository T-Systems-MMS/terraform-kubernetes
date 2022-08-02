/**
 * # kubernetes
 *
 * This module manages kubernetes.
 *
*/

resource "kubernetes_service_account" "service_account" {
  for_each = var.service_account

  metadata {
    name          = local.service_account[each.key].metadata.name == "" ? each.key : local.service_account[each.key].metadata.name
    namespace     = local.service_account[each.key].metadata.namespace
    annotations   = local.service_account[each.key].metadata.annotations
    generate_name = local.service_account[each.key].metadata.generate_name
    labels = {
      for label in keys(local.service_account[each.key].metadata.labels) :
      label => local.service_account[each.key].metadata.labels[label]
    }
  }
  automount_service_account_token = local.service_account[each.key].automount_service_account_token
}

resource "kubernetes_cluster_role_binding" "cluster_role_binding" {
  for_each = var.cluster_role_binding

  metadata {
    name = local.cluster_role_binding[each.key].metadata.name == "" ? each.key : local.cluster_role_binding[each.key].metadata.name
    annotations   = local.cluster_role_binding[each.key].metadata.annotations
    #generate_name = local.cluster_role_binding[each.key].metadata.generate_name
    labels = {
      for label in keys(local.cluster_role_binding[each.key].metadata.labels) :
      label => local.service_account[each.key].metadata.labels[label]
    }
  }

  role_ref {
    name      = local.cluster_role_binding[each.key].role_ref.name
    kind      = local.cluster_role_binding[each.key].role_ref.kind
    api_group = local.cluster_role_binding[each.key].role_ref.api_group
  }

  dynamic "subject" {
    for_each = local.cluster_role_binding[each.key].subject

    content {
      name      = local.cluster_role_binding[each.key].subject[subject.key].name == "" ? each.key : local.cluster_role_binding[each.key].subject[subject.key].name
      namespace = local.cluster_role_binding[each.key].subject[subject.key].namespace
      kind      = local.cluster_role_binding[each.key].subject[subject.key].kind
      api_group = local.cluster_role_binding[each.key].subject[subject.key].api_group
    }
  }
}

resource "kubernetes_role_binding" "role_binding" {
  for_each = var.role_binding

  metadata {
    name = local.role_binding[each.key].metadata.name == "" ? each.key : local.role_binding[each.key].metadata.name
    namespace = local.role_binding[each.key].metadata.namespace
    annotations   = local.role_binding[each.key].metadata.annotations
    #generate_name = local.role_binding[each.key].metadata.generate_name
    labels = {
      for label in keys(local.role_binding[each.key].metadata.labels) :
      label => local.service_account[each.key].metadata.labels[label]
    }
  }

  role_ref {
    name      = local.role_binding[each.key].role_ref.name
    kind      = local.role_binding[each.key].role_ref.kind
    api_group = local.role_binding[each.key].role_ref.api_group
  }

  dynamic "subject" {
    for_each = local.role_binding[each.key].subject

    content {
      name      = local.role_binding[each.key].subject[subject.key].name == "" ? each.key : local.role_binding[each.key].subject[subject.key].name
      namespace = local.role_binding[each.key].subject[subject.key].namespace
      kind      = local.role_binding[each.key].subject[subject.key].kind
      api_group = local.role_binding[each.key].subject[subject.key].api_group
    }
  }
}

resource "kubernetes_namespace" "namespace" {
  for_each = var.namespace

  metadata {
    name          = local.namespace[each.key].metadata.name == "" ? each.key : local.namespace[each.key].metadata.name
    annotations   = local.namespace[each.key].metadata.annotations
    generate_name = local.namespace[each.key].metadata.generate_name
    labels = {
      for label in keys(local.namespace[each.key].metadata.labels) :
      label => local.namespace[each.key].metadata.labels[label]
    }
  }
}

resource "kubernetes_secret" "secret" {
  for_each = var.secret

  metadata {
    name          = local.secret[each.key].metadata.name == "" ? each.key : local.secret[each.key].metadata.name
    namespace     = local.secret[each.key].metadata.namespace
    annotations   = local.secret[each.key].metadata.annotations
    generate_name = local.secret[each.key].metadata.generate_name
    labels = {
      for label in keys(local.secret[each.key].metadata.labels) :
      label => local.service_account[each.key].metadata.labels[label]
    }
  }

  data        = local.secret[each.key].data
  binary_data = local.secret[each.key].binary_data
  type        = local.secret[each.key].type
  immutable   = local.secret[each.key].immutable
}

resource "kubernetes_config_map" "config_map" {
  for_each = var.config_map

  metadata {
    name          = local.config_map[each.key].metadata.name == "" ? each.key : local.config_map[each.key].metadata.name
    namespace     = local.config_map[each.key].metadata.namespace
    annotations   = local.config_map[each.key].metadata.annotations
    generate_name = local.config_map[each.key].metadata.generate_name
    labels = {
      for label in keys(local.config_map[each.key].metadata.labels) :
      label => local.service_account[each.key].metadata.labels[label]
    }
  }

  data        = local.config_map[each.key].data
  binary_data = local.config_map[each.key].binary_data
}

resource "kubernetes_storage_class" "storage_class" {
  for_each = var.storage_class

  metadata {
    name          = local.storage_class[each.key].metadata.name == "" ? each.key : local.storage_class[each.key].metadata.name
    annotations   = local.storage_class[each.key].metadata.annotations
    generate_name = local.storage_class[each.key].metadata.generate_name
    labels = {
      for label in keys(local.storage_class[each.key].metadata.labels) :
      label => local.service_account[each.key].metadata.labels[label]
    }
  }

  parameters = local.storage_class[each.key].parameters
  storage_provisioner = local.storage_class[each.key].storage_provisioner
  reclaim_policy = local.storage_class[each.key].reclaim_policy
  volume_binding_mode  = local.storage_class[each.key].volume_binding_mode
  allow_volume_expansion  = local.storage_class[each.key].allow_volume_expansion
  mount_options = local.storage_class[each.key].mount_options

  dynamic "allowed_topologies" {
    for_each = local.storage_class[each.key].allowed_topologies.match_label_expressions != {} ? [1] : []

    content {
      dynamic "match_label_expressions" {
        for_each = local.storage_class[each.key].allowed_topologies.match_label_expressions

        content {
          key    = local.storage_class[each.key].allowed_topologies.match_label_expressions[each.key]
          values = local.storage_class[each.key].allowed_topologies.match_label_expressions[each.value]
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "persistent_volume_claim" {
  for_each = var.persistent_volume_claim

  metadata {
    name          = local.persistent_volume_claim[each.key].metadata.name == "" ? each.key : local.persistent_volume_claim[each.key].metadata.name
    namespace  = local.persistent_volume_claim[each.key].metadata.namespace
    annotations   = local.persistent_volume_claim[each.key].metadata.annotations
    generate_name = local.persistent_volume_claim[each.key].metadata.generate_name
    labels = {
      for label in keys(local.persistent_volume_claim[each.key].metadata.labels) :
      label => local.service_account[each.key].metadata.labels[label]
    }
  }

  spec {
    access_modes   = local.persistent_volume_claim[each.key].spec.access_modes
    volume_name  = local.persistent_volume_claim[each.key].spec.volume_name
    storage_class_name = local.persistent_volume_claim[each.key].spec.storage_class_name

    resources {
      limits = local.persistent_volume_claim[each.key].spec.resources.limits
      requests = local.persistent_volume_claim[each.key].spec.resources.requests
    }

    dynamic "selector" {
      for_each = compact([
        local.persistent_volume_claim[each.key].spec.selector.match_labels,
        local.persistent_volume_claim[each.key].spec.selector.match_expressions.key,
        local.persistent_volume_claim[each.key].spec.selector.match_expressions.operator,
        local.persistent_volume_claim[each.key].spec.selector.match_expressions.values
      ])

      content {
        match_labels = local.persistent_volume_claim[each.key].spec.selector.match_labels

        match_expressions {
          key = local.persistent_volume_claim[each.key].spec.selector.match_expressions.key
          operator = local.persistent_volume_claim[each.key].spec.selector.match_expressions.operator
          values = local.persistent_volume_claim[each.key].spec.selector.match_expressions.values
        }
      }
    }
  }
  wait_until_bound =  local.persistent_volume_claim[each.key].wait_until_bound
}
