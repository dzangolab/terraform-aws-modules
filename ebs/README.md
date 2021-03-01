# AWS EBS volumemodule

This modules provisions an EBS volume.

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
| [aws_ebs_volume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zone | The AZ where the EBS volume will exist. | `string` | n/a | yes |
| name | Name of elastic ip address | `string` | `""` | no |
| size | The size of the drive in GiBs. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| az | n/a |
| id | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->