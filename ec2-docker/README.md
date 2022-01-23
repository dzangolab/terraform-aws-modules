# EC2 Docker compose module

This module provisions an EC2 instance with docker CE and docker-compose installed.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 1.4.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | ~> 2.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.73.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 1.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip_association.elastic_ip_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [local_file.ansible_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.private_ip](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [aws_eip.elastic_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eip) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | Ubuntu Server 20.04 LTS AMI (HVM), SSD Volume Type (64bit x86) | `string` | `"ami-09a6a7e49bd29554b"` | no |
| <a name="input_ansible_inventory"></a> [ansible\_inventory](#input\_ansible\_inventory) | Template for generating the ansible inventory | `string` | `"templates/hosts.tmpl"` | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | If true, the EC2 instance will have associated public IP address | `bool` | `false` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | If true, enables EC2 Instance Termination Protection | `bool` | `true` | no |
| <a name="input_docker_compose"></a> [docker\_compose](#input\_docker\_compose) | If true, install docker-compose | `bool` | `false` | no |
| <a name="input_docker_compose_version"></a> [docker\_compose\_version](#input\_docker\_compose\_version) | docker-compose version to install | `string` | `"1.29.2"` | no |
| <a name="input_eip_allocation_id"></a> [eip\_allocation\_id](#input\_eip\_allocation\_id) | The allocation ID of the Elastic IP address | `string` | n/a | yes |
| <a name="input_instance_profile"></a> [instance\_profile](#input\_instance\_profile) | The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type | `string` | `"t2.micro"` | no |
| <a name="input_key_path"></a> [key\_path](#input\_key\_path) | SSH public key path | `string` | `"~/.ssh/id_rsa.pub"` | no |
| <a name="input_monitoring"></a> [monitoring](#input\_monitoring) | If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The instance's name | `string` | n/a | yes |
| <a name="input_packages"></a> [packages](#input\_packages) | Packages to install | `list(string)` | <pre>[<br>  "ntp"<br>]</pre> | no |
| <a name="input_private_ip_template"></a> [private\_ip\_template](#input\_private\_ip\_template) | Template for generating the private ip group vars | `string` | `"templates/private_ip.tmpl"` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | A list of public SSH keys to add to the instance user | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Id of subnet | `string` | n/a | yes |
| <a name="input_swap_file"></a> [swap\_file](#input\_swap\_file) | Name of swap file | `string` | `"/swap"` | no |
| <a name="input_swap_size"></a> [swap\_size](#input\_swap\_size) | Size of swapfile in bytes | `number` | `0` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. Note that these tags apply to the instance and not block storage devices | `map(string)` | `{}` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Relative path to user-data template file | `string` | `"./templates/cloud-config.tmpl"` | no |
| <a name="input_user_groups"></a> [user\_groups](#input\_user\_groups) | List of groups to assign to user | `list(string)` | <pre>[<br>  "docker",<br>  "sudo"<br>]</pre> | no |
| <a name="input_username"></a> [username](#input\_username) | Username of the user to access the instance | `string` | n/a | yes |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | A list of security group IDs to associate with | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ip"></a> [instance\_ip](#output\_instance\_ip) | The instance's public ipv4 adress -- DEPRECATED: Use `public_ip` instead. |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | The instance's private ipv4 address |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The instance's public ipv4 address |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->