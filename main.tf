/**
 * # kubernetes
 *
 * This module manages kubernetes.
 *
*/

resource "kubernetes_service_account" "service_account" {
  for_each = var.kubernetes_service_account

  metadata {
    name      = local.kubernetes_service_account[each.key].metadata.name == "" ? each.key : local.kubernetes_service_account[each.key].metadata.name
    namespace = local.kubernetes_service_account[each.key].metadata.namespace
  }
}

resource "kubernetes_cluster_role_binding" "cluster_role_binding" {
  for_each = var.kubernetes_cluster_role_binding

  metadata {
    name = local.kubernetes_cluster_role_binding[each.key].metadata.name == "" ? each.key : local.kubernetes_cluster_role_binding[each.key].metadata.name
  }

  role_ref {
    api_group = local.kubernetes_cluster_role_binding[each.key].role_ref.api_group
    kind      = local.kubernetes_cluster_role_binding[each.key].role_ref.kind
    name      = local.kubernetes_cluster_role_binding[each.key].role_ref.name
  }
  subject {
    kind      = local.kubernetes_cluster_role_binding[each.key].subject.kind
    name      = local.kubernetes_cluster_role_binding[each.key].subject.name
    namespace = local.kubernetes_cluster_role_binding[each.key].subject.namespace
  }
}

resource "kubernetes_namespace" "namespace" {
  for_each = var.kubernetes_namespace

  metadata {
    name = local.kubernetes_namespace[each.key].metadata.name == "" ? each.key : local.kubernetes_namespace[each.key].metadata.name
    annotations = local.kubernetes_namespace[each.key].metadata.annotations
    labels      = local.kubernetes_namespace[each.key].metadata.labels
  }
}

resource "kubernetes_secret" "secret" {
  for_each = var.kubernetes_secret

  metadata {
    name      = local.kubernetes_secret[each.key].metadata.name == "" ? each.key : local.kubernetes_secret[each.key].metadata.name
    namespace = local.kubernetes_secret[each.key].metadata.namespace
  }

  data = local.kubernetes_secret[each.key].data
  type = local.kubernetes_secret[each.key].type
}
