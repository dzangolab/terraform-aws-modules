variable "groups" {
  default     = []
  description = "Groups who are allowed to manage the bucket"
  type        = list(string)
}

variable "name" {
  description = "Name of the bucket to create"
  type        = string
}

variable "roles" {
  default     = []
  description = "IAM roles who are allowed to manage the bucket"
  type        = list(string)
}

variable "users" {
  default     = []
  description = "Users who are allowed to manage the bucket"
  type        = list(string)
}
