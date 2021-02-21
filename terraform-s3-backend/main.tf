resource "aws_s3_bucket" "terraform_state" {
  acl    = "private"
  bucket = var.s3_bucket
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_state" {
  name           = var.dynamodb_table_name
  billing_mode   = var.dynamodb_billing_mode
  hash_key       = "LockID"
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity

  attribute {
    name = "LockID"
    type = "S"
  }
}

data "template_file" "terraform_policy" {
  template = file("${path.module}/templates/iam-policy.tpl")

  vars = {
    bucket_arn         = aws_s3_bucket.terraform_state.arn
    dynamodb_table_arn = aws_dynamodb_table.terraform_state.arn
  }
}

resource "aws_iam_policy" "terraform" {
  name = var.policy_name

  policy = data.template_file.terraform_policy.rendered
}

resource "aws_iam_group" "terraform" {
  name = var.iam_group
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.terraform.name
  policy_arn = aws_iam_policy.terraform.arn
}
