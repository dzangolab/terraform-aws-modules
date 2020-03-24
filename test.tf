# test terraform plan to validate terraform syntax in gitlab ci

provider "aws" {
  profile = "dzangolab"
  region  = "ap-southeast-1"
  version = "~> 2.16"
}

module "test_aws_docker_swarm" {
  source = "./aws-docker-swarm"

  eip_address       = ""
  eip_allocation_id = ""
  key_pair_name     = ""
  swarm_name        = ""
}

module "test_s3_bucket" {
  source = "./s3-bucket"

  policy_name = "test-s3-bucket"
}

module "test_secrets_ro_policy" {
  source = "./secrets-readonly-policy"

  policy_name = "test-secrets-readonly"
}

module "test_secrets_rw_policy" {
  source = "./secrets-readwrite-policy"

  policy_name = "test-secrets-readwrite"
}
