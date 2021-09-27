# AWS EBS volume module

This modules provisions an EBS volume.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.60.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The AZ where the EBS volume will exist. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of elastic ip address | `string` | `""` | no |
| <a name="input_size"></a> [size](#input\_size) | The size of the drive in GiBs. | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The volume ARN (e.g. arn:aws:ec2:us-east-1:0123456789012:volume/vol-59fcb34e). |
| <a name="output_availability_zone"></a> [availability\_zone](#output\_availability\_zone) | The volume's availability zone |
| <a name="output_az"></a> [az](#output\_az) | The volume's availability zone |
| <a name="output_id"></a> [id](#output\_id) | The volume ID (e.g. vol-59fcb34e). |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
