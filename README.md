# terraform-module-kubernetes-alertmanager-webhook-servicenow

Terraform module to deploy alertmanager webhook servicenow on kubernetes.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| kubernetes | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| annotations | Additionnal annotations that will be merged on all resources. | `map` | `{}` | no |
| application\_version | Version of AWSN to deploy. | `string` | `"1.6.0"` | no |
| config\_map\_annotations | Additionnal annotations that will be merged for the config map. | `map` | `{}` | no |
| config\_map\_labels | Additionnal labels that will be merged for the config map. | `map` | `{}` | no |
| config\_map\_name | Name of the config map that will be created. | `string` | `"alertmanager-webhook-servicenow"` | no |
| configuration | Configuration to use for alertmanager-webhook-servicenow (must be a yaml string). | `string` | n/a | yes |
| deployment\_annotations | Additionnal annotations that will be merged on the deployment. | `map` | `{}` | no |
| deployment\_labels | Additionnal labels that will be merged on the deployment. | `map` | `{}` | no |
| deployment\_name | Name of the deployment that will be create. | `string` | `"alertmanager-webhook-servicenow"` | no |
| enabled | Whether or not to enable this module. | `bool` | `true` | no |
| image\_pull\_policy | Image pull policy on the main container. | `string` | `"IfNotPresent"` | no |
| instance\_name | Name of the service-now instance to connect to. | `string` | n/a | yes |
| labels | Additionnal labels that will be merged on all resources. | `map` | `{}` | no |
| namespace | Namespace in which the module will be deployed. | `string` | `"default"` | no |
| password | Password to use when connecting to service-now. | `string` | n/a | yes |
| port | Port to be used for the service. | `number` | `80` | no |
| replicas | Number of replicas to deploy. | `number` | `2` | no |
| secret\_annotations | Additionnal annotations that will be merged for the secret. | `map` | `{}` | no |
| secret\_labels | Additionnal labels that will be merged for the secret. | `map` | `{}` | no |
| secret\_name | Name of the secret that will be created. | `string` | `"alertmanager-webhook-servicenow"` | no |
| service\_annotations | Additionnal annotations that will be merged for the service. | `map` | `{}` | no |
| service\_labels | Additionnal labels that will be merged for the service. | `map` | `{}` | no |
| service\_name | Name of the service that will be create | `string` | `"alertmanager-webhook-servicenow"` | no |
| user\_name | Username to use when connecting to service-now. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| config\_map\_name | Name of the config\_map created by this module. |
| deployment\_name | Name of the deployment created by this module. |
| namespace | Namespace in which the module is deployed. |
| port | Port on which the service listens. |
| secret\_name | Name of the secret created by this module. |
| service\_name | Name of the service created by this module. |

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
