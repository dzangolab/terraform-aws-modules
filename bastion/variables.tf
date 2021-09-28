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

variable "ssh_keys" {
  description = "A list of public SSH keys to add to the instance user"
  type        = list(string)
}

variable "subnet_id" {
  description = "Id of subnet"
  type        = string
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
    "sudo"
  ]
  description = "List of groups to assign to user"
  type        = list(string)
}

variable "username" {
  description = "Username of the user to access the instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}
