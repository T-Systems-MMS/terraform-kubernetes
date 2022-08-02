<!-- BEGIN_TF_DOCS -->

# kubernetes

This module manages kubernetes.

## Requirements

| Name                                                                        | Version |
| --------------------------------------------------------------------------- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | ~>1.0   |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | ~>2.0   |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | ~>2.0   |

## Modules

No modules.

## Resources

| Name                                                 | Type     |
| ---------------------------------------------------- | -------- |
| kubernetes_cluster_role_binding.cluster_role_binding | resource |
| kubernetes_namespace.namespace                       | resource |
| kubernetes_secret.secret                             | resource |
| kubernetes_service_account.service_account           | resource |

## Inputs

| Name                                                                                                                           | Description                                                                                  | Type  | Default | Required |
| ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- | ----- | ------- | :------: |
| <a name="input_kubernetes_cluster_role_binding"></a> [kubernetes_cluster_role_binding](#input_kubernetes_cluster_role_binding) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}`    |    no    |
| <a name="input_kubernetes_namespace"></a> [kubernetes_namespace](#input_kubernetes_namespace)                                  | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}`    |    no    |
| <a name="input_kubernetes_secret"></a> [kubernetes_secret](#input_kubernetes_secret)                                           | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}`    |    no    |
| <a name="input_kubernetes_service_account"></a> [kubernetes_service_account](#input_kubernetes_service_account)                | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}`    |    no    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
