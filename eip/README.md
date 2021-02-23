# AWS EIP module

This modules provisions an Elastic IP address.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.27 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.27 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of elastic ip address | `string` | `""` | no |
| vpc | Boolean if the EIP is in a VPC or not | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| allocation\_id | n/a |
| public\_ip | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->