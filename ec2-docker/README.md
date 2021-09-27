# EC2 Docker compose module

This module provisions an EC2 instance with docker CE and docker-compose installed.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | ~> 3.27 |
| local | ~> 1.4.0 |
| template | ~> 2.1.2 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.27 |
| local | ~> 1.4.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eip) |
| [aws_eip_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) |
| [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) |
| [aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) |
| [local_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | Ubuntu Server 20.04 LTS AMI (HVM), SSD Volume Type (64bit x86) | `string` | `"ami-09a6a7e49bd29554b"` | no |
| ansible\_inventory | Template for generating the ansible inventory | `string` | `"templates/hosts.tmpl"` | no |
| associate\_public\_ip\_address | If true, the EC2 instance will have associated public IP address | `bool` | `false` | no |
| disable\_api\_termination | If true, enables EC2 Instance Termination Protection | `bool` | `true` | no |
| eip\_allocation\_id | The allocation ID of the Elastic IP address | `string` | n/a | yes |
| instance\_profile | The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. | `string` | n/a | yes |
| instance\_type | Instance type | `string` | `"t2.micro"` | no |
| key\_path | SSH public key path | `string` | `"~/.ssh/id_rsa.pub"` | no |
| monitoring | If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | `false` | no |
| name | The instance's name | `string` | n/a | yes |
| packages | Packages to install | `list(string)` | <pre>[<br>  "ntp"<br>]</pre> | no |
| ssh\_keys | A list of public SSH keys to add to the instance user | `list(string)` | n/a | yes |
| subnet\_id | Id of subnet | `string` | n/a | yes |
| swap\_file | Name of swap file | `string` | `"/swap"` | no |
| swap\_size | Size of swapfile in bytes | `number` | `0` | no |
| tags | A map of tags to assign to the resource. Note that these tags apply to the instance and not block storage devices | `map(string)` | `{}` | no |
| user\_data | Relative path to user-data template file | `string` | `"./templates/cloud-config.tmpl"` | no |
| user\_groups | List of groups to assign to user | `list(string)` | <pre>[<br>  "docker",<br>  "sudo"<br>]</pre> | no |
| username | Username of the user to access the instance | `string` | n/a | yes |
| vpc\_security\_group\_ids | A list of security group IDs to associate with | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_ip | The instance's public ipv4 adress |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->