# terraform-module-kubernetes-alertmanager-webhook-servicenow

Terraform module to deploy alertmanager webhook servicenow on kubernetes.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_config_map.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map) | resource |
| [kubernetes_deployment.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [random_string.selector](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Additionnal annotations that will be merged on all resources. | `map` | `{}` | no |
| <a name="input_application_version"></a> [application\_version](#input\_application\_version) | Version of AWSN to deploy. | `string` | `"1.6.0"` | no |
| <a name="input_config_map_annotations"></a> [config\_map\_annotations](#input\_config\_map\_annotations) | Additionnal annotations that will be merged for the config map. | `map` | `{}` | no |
| <a name="input_config_map_labels"></a> [config\_map\_labels](#input\_config\_map\_labels) | Additionnal labels that will be merged for the config map. | `map` | `{}` | no |
| <a name="input_config_map_name"></a> [config\_map\_name](#input\_config\_map\_name) | Name of the config map that will be created. | `string` | `"alertmanager-webhook-servicenow"` | no |
| <a name="input_configuration"></a> [configuration](#input\_configuration) | Configuration to use for alertmanager-webhook-servicenow (must be a yaml string). | `string` | n/a | yes |
| <a name="input_deployment_annotations"></a> [deployment\_annotations](#input\_deployment\_annotations) | Additionnal annotations that will be merged on the deployment. | `map` | `{}` | no |
| <a name="input_deployment_labels"></a> [deployment\_labels](#input\_deployment\_labels) | Additionnal labels that will be merged on the deployment. | `map` | `{}` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Name of the deployment that will be create. | `string` | `"alertmanager-webhook-servicenow"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether or not to enable this module. | `bool` | `true` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Image pull policy on the main container. | `string` | `"IfNotPresent"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the service-now instance to connect to. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Additionnal labels that will be merged on all resources. | `map` | `{}` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace in which the module will be deployed. | `string` | `"default"` | no |
| <a name="input_password"></a> [password](#input\_password) | Password to use when connecting to service-now. | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Port to be used for the service. | `number` | `80` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas to deploy. | `number` | `2` | no |
| <a name="input_secret_annotations"></a> [secret\_annotations](#input\_secret\_annotations) | Additionnal annotations that will be merged for the secret. | `map` | `{}` | no |
| <a name="input_secret_labels"></a> [secret\_labels](#input\_secret\_labels) | Additionnal labels that will be merged for the secret. | `map` | `{}` | no |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Name of the secret that will be created. | `string` | `"alertmanager-webhook-servicenow"` | no |
| <a name="input_service_annotations"></a> [service\_annotations](#input\_service\_annotations) | Additionnal annotations that will be merged for the service. | `map` | `{}` | no |
| <a name="input_service_labels"></a> [service\_labels](#input\_service\_labels) | Additionnal labels that will be merged for the service. | `map` | `{}` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Name of the service that will be create | `string` | `"alertmanager-webhook-servicenow"` | no |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | Username to use when connecting to service-now. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_map_name"></a> [config\_map\_name](#output\_config\_map\_name) | Name of the config\_map created by this module. |
| <a name="output_deployment_name"></a> [deployment\_name](#output\_deployment\_name) | Name of the deployment created by this module. |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | Namespace in which the module is deployed. |
| <a name="output_port"></a> [port](#output\_port) | Port on which the service listens. |
| <a name="output_secret_name"></a> [secret\_name](#output\_secret\_name) | Name of the secret created by this module. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Name of the service created by this module. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

All contributions are welcome, but take notice of the following requirements:

### pre-commit
This repository uses a pre-commit configuration file. Our CI will make sure it runs before deploying anything. [More information](https://pre-commit.com/)

#### Usage

```
pre-commit install
pre-commit install -t commit-msg
```

### versioning
This repository follows the [semantic versionning v2.0.0](https://semver.org/) conventions.

### commit messages
This repository follows the [AFCMF](https://dokuportal.fxinnovation.com/dokuwiki/doku.php?id=groups:git#afcmf) commit message standards.

### terraform best-practices
This repository follows the [FXinnovation Terraform standards](https://dokuportal.fxinnovation.com/dokuwiki/doku.php?id=groups:terraform).

### changelog

The changelog message is generated using the `git-extras` package using the following command:
```
git changelog -a -t <target-version> -p
```
