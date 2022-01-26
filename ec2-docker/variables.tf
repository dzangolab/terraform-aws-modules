//-------------------------------------------------------------------
// Key pair
//-------------------------------------------------------------------
variable "key_path" {
  description = "SSH public key path"
  default     = "~/.ssh/id_rsa.pub"
  type        = string
}

//-------------------------------------------------------------------
// Instance settings
//-------------------------------------------------------------------

variable "ami" {
  default     = "ami-09a6a7e49bd29554b"
  description = "Ubuntu Server 20.04 LTS AMI (HVM), SSD Volume Type (64bit x86)"
  type        = string
}

variable "ansible_inventory" {
  default     = "templates/hosts.tmpl"
  description = "Template for generating the ansible inventory"
  type        = string
}

variable "associate_public_ip_address" {
  default     = false
  description = "If true, the EC2 instance will have associated public IP address"
  type        = bool
}

variable "disable_api_termination" {
  default     = true
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
}

variable "eip_allocation_id" {
  description = "The allocation ID of the Elastic IP address"
  type        = string
}

variable "instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  type        = string
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type"
  type        = string
}

variable "monitoring" {
  default     = false
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
}

variable "name" {
  description = "The instance's name"
  type        = string
}

variable "packages" {
  default = [
    "ntp"
  ]
  description = "Packages to install"
  type        = list(string)
}

variable "private_ip_template" {
  default     = "templates/private_ip.tmpl"
  description = "Template for generating the private ip group vars"
  type        = string
}

variable "root_block_device" {
  default = {
    delete_on_termination = true
    volume_size           = 16
    volume_type           = "gp2"
  }
  description = "Configuration block to customize details about the root block device of the instance."
  type = object({
    delete_on_termination = bool
    volume_size           = number
    volume_type           = string
  })
}

variable "ssh_keys" {
  description = "A list of public SSH keys to add to the instance user"
  type        = list(string)
}

variable "subnet_id" {
  description = "Id of subnet"
  type        = string
}

variable "swap_file" {
  default     = "/swap"
  description = "Name of swap file"
  type        = string
}

variable "swap_size" {
  default     = 0
  description = "Size of swapfile in bytes"
  type        = number
}

variable "tags" {
  default     = {}
  description = "A map of tags to assign to the resource. Note that these tags apply to the instance and not block storage devices"
  type        = map(string)
}

variable "user_data" {
  default     = "./templates/cloud-config.tmpl"
  description = "Relative path to user-data template file"
  type        = string
}

variable "user_groups" {
  default = [
    "docker",
    "sudo"
  ]
  description = "List of groups to assign to user"
  type        = list(string)
}

variable "username" {
  description = "Username of the user to access the instance"
  type        = string
}

variable "volumes" {
  default = [{
    device     = ""
    fstype     = ""
    id         = "none"
    initialize = false
    path       = ""
  }]
  description = "List of block storage volumes to be attached to the instance."
  type = list(object({
    device     = string
    fstype     = string
    id         = string
    initialize = bool
    path       = string
  }))
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

//-------------------------------------------------------------------
// docker-compose settings
//-------------------------------------------------------------------

variable "docker_compose" {
  default     = false
  description = "If true, install docker-compose"
  type        = bool
}

variable "docker_compose_version" {
  default     = "1.29.2"
  description = "docker-compose version to install"
  type        = string
}
