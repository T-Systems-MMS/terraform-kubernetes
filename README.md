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
| kubernetes_persistent_volume_claim.persistent_volume_claim | resource |
| kubernetes_role_binding.role_binding | resource |
| kubernetes_secret.secret | resource |
| kubernetes_service.service | resource |
| kubernetes_service_account.service_account | resource |
| kubernetes_storage_class.storage_class | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_role_binding"></a> [cluster\_role\_binding](#input\_cluster\_role\_binding) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_config_map"></a> [config\_map](#input\_config\_map) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_persistent_volume_claim"></a> [persistent\_volume\_claim](#input\_persistent\_volume\_claim) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_role_binding"></a> [role\_binding](#input\_role\_binding) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_secret"></a> [secret](#input\_secret) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_service"></a> [service](#input\_service) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_role_binding"></a> [cluster\_role\_binding](#output\_cluster\_role\_binding) | kubernetes\_cluster\_role\_binding results |
| <a name="output_config_map"></a> [config\_map](#output\_config\_map) | kubernetes\_config\_map results |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | kubernetes\_namespace results |
| <a name="output_persistent_volume_claim"></a> [persistent\_volume\_claim](#output\_persistent\_volume\_claim) | kubernetes\_persistent\_volume\_claim results |
| <a name="output_role_binding"></a> [role\_binding](#output\_role\_binding) | kubernetes\_role\_binding results |
| <a name="output_secret"></a> [secret](#output\_secret) | kubernetes\_secret results |
| <a name="output_service"></a> [service](#output\_service) | kubernetes\_service results |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | kubernetes\_service\_account results |
| <a name="output_storage_class"></a> [storage\_class](#output\_storage\_class) | kubernetes\_storage\_class results |
<!-- END_TF_DOCS -->