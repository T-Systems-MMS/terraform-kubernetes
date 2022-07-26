<!-- BEGIN_TF_DOCS -->
# kubernetes

This module manages kubernetes.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~>2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~>2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| kubernetes_cluster_role_binding.cluster_role_binding | resource |
| kubernetes_config_map.config_map | resource |
| kubernetes_namespace.namespace | resource |
| kubernetes_secret.secret | resource |
| kubernetes_service_account.service_account | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kubernetes_cluster_role_binding"></a> [kubernetes\_cluster\_role\_binding](#input\_kubernetes\_cluster\_role\_binding) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_kubernetes_config_map"></a> [kubernetes\_config\_map](#input\_kubernetes\_config\_map) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_kubernetes_namespace"></a> [kubernetes\_namespace](#input\_kubernetes\_namespace) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_kubernetes_secret"></a> [kubernetes\_secret](#input\_kubernetes\_secret) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_kubernetes_service_account"></a> [kubernetes\_service\_account](#input\_kubernetes\_service\_account) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace"></a> [namespace](#output\_namespace) | kubernetes\_namespace results |
<!-- END_TF_DOCS -->