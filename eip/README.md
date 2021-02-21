# AWS EIP module

This modules provisions an Elastic IP address.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of elastic ip address | `string` | `""` | no |
| vpc | Boolean if the EIP is in a VPC or not | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| eip\_allocation\_id | n/a |
| eip\_public\_ip | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->