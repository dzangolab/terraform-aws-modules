variable "acl" {
  default     = "private"
  description = "The canned ACL to apply. Valid values are `private`, `public-read`, `public-read-write`, `aws-exec-read`, `authenticated-read`, `and log-delivery-write`. Defaults to `private`."
  type        = string
}

variable "force_destroy" {
  default     = "false"
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
}

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
