variable "name" {
  default     = ""
  description = "Name of elastic ip address"
  type        = string
}

variable "vpc" {
  default     = true
  description = "Boolean if the EIP is in a VPC or "
  type        = bool
}