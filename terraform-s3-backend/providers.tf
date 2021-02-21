terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 1.4.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.1.2"
    }
  }
  required_version = ">= 0.13.0"
}
