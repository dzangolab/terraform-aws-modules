resource "aws_s3_bucket" "bucket" {
  acl    = "private"
  bucket = var.name
  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = false
  }
}

resource "aws_secretsmanager_secret" "secret" {
  name = var.name
}