//-------------------------------------------------------------------
// General settings
//-------------------------------------------------------------------
variable "env" {
  default = "sandbox"
}

variable "eip_allocation_id" {
  description = "The allocation ID of the Elastic IP address"
}

variable "eip_address" {
  description = "The Elastic IP address to be attached to first manager"
}

//-------------------------------------------------------------------
// Connection settings
//-------------------------------------------------------------------

variable "connection_timeout" {
  description = "Timeout for connection to servers"
  default     = "2m"
}

variable "key_pair_name" {
  description = "The name for the key pair"
}

variable "key_path" {
  description = "SSH public key path"
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_public_keys" {
  type        = string
  description = "SSH public keys to add to instances"
  default     = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDELveXoYQaHEKI5s98D9J+uHuYAa010EWp+leSkpa5RKZsFZMleK8ujSD72qW4iGIIrghHVQazRAxjs+lCsGYZ3p0/KNKgUuwHpSqmDJ2aJx9UirI9Ba4omSwC9jqbhxDBZtg7DUmbPR80dCSyvOQDuActIlKoONhjxE1hw7sd3VvmYOYQ8uoTZA6s7qG72hPLf/HX2UM56y8WCYc83F7TE9QyfLDXYPNZnEWX9YGr6oPFm5E4M3jRAwJK2gba8cKFNjfLbfYXZcx3YqAbBiaVuRMdBt9c3BDBEppohAaNiSwmyN2s/0Vb9CyituP4hV8KK/iwX1HJu/ZE0L9rETT op@united-asian.com
EOF

}

variable "ssh_user" {
  default = "ubuntu"
}

//-------------------------------------------------------------------
// Swarm settings
//-------------------------------------------------------------------

variable "ami" {
  description = "Ubuntu Server 18.04 LTS AMI"
  default = "ami-0dad20bd1b9c8c004"
}

variable "manager_instance_type" {
  description = "Manager instance type"
  default = "t2.micro"
}

variable "subnet_main_cidr" {
  default = "192.168.0.0/24"
}

variable "swarm_manager_count" {
  default = 1
}

variable "swarm_manager_name" {
  default = "manager"
}

variable "swarm_name" {
}

variable "swarm_worker_count" {
  default = 1
}

variable "swarm_worker_name" {
  default = "worker"
}

variable "vpc_cidr" {
  default = "192.168.0.0/24"
}

variable "worker_instance_type" {
  description = "Worker instance type"
  default = "t2.micro"
}

