variable "availability_zone" {
  description = "The AZ where the EBS volume will exist."
  type        = string
}

variable "name" {
  default     = ""
  description = "Name of elastic ip address"
  type        = string
}

variable "size" {
  default     = 1
  description = "The size of the drive in GiBs."
  type        = number
}
