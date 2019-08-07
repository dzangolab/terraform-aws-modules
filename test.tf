provider "aws" {
  profile = "dzangolab"
  region  = "ap-southeast-1"
  version = "~> 2.16"
}

module "test_policy" {
  source = "./secrets-readwrite"

  policy_name = "test"
}
