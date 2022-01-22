# AWS Instance Profile module

This modules provisions an instance profile.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.27 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of instance profile and role | `string` | n/a | yes |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | ARNs of policies to attach to the role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN assigned by AWS to the instance profile. |
| <a name="output_create_date"></a> [create\_date](#output\_create\_date) | Creation timestamp of the instance profile. |
| <a name="output_id"></a> [id](#output\_id) | Instance profile's ID. |
| <a name="output_name"></a> [name](#output\_name) | Instance profile's name. |
| <a name="output_name_prefix"></a> [name\_prefix](#output\_name\_prefix) | Instance profile's name prefix. |
| <a name="output_path"></a> [path](#output\_path) | Instance profile's path. |
| <a name="output_role"></a> [role](#output\_role) | Instance profile's role. |
| <a name="output_tags"></a> [tags](#output\_tags) | Map of resource tags for the IAM Instance Profile. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | Unique ID assigned by AWS. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
    