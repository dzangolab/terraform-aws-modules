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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | Ubuntu Server 20.04 LTS AMI (HVM), SSD Volume Type (64bit x86) | `string` | `"ami-09a6a7e49bd29554b"` | no |
| disable\_api\_termination | If true, enables EC2 Instance Termination Protection | `bool` | `true` | no |
| eip\_allocation\_id | The allocation ID of the Elastic IP address | `string` | `""` | no |
| instance\_type | Instance type | `string` | `"t2.micro"` | no |
| key\_name | Name of the key pair | `string` | n/a | yes |
| key\_path | SSH public key path | `string` | `"~/.ssh/id_rsa.pub"` | no |
| packages | Packages to install | `list(string)` | <pre>[<br>  "ntp"<br>]</pre> | no |
| ssh\_keys | A list of public SSH keys to add to the instance user | `list(string)` | `[]` | no |
| subnet\_id | Id of subnet | `string` | `""` | no |
| swap\_file | Name of swap file | `string` | `"/swap"` | no |
| swap\_size | Size of swapfile in bytes | `number` | `0` | no |
| tags | A map of tags to assign to the resource. Note that these tags apply to the instance and not block storage devices | `list(string)` | `[]` | no |
| user\_data | Relative path to user-data template file | `string` | `"./templates/cloud-config.tmpl"` | no |
| user\_groups | List of groups to assign to user | `list(string)` | <pre>[<br>  "docker",<br>  "sudo"<br>]</pre> | no |
| username | Username of the user to access the instance | `string` | `""` | no |
| vpc\_security\_group\_ids | A list of security group IDs to associate with | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_ip | The instance's public ipv4 adress |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->