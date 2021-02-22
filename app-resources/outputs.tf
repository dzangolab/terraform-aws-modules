output "bucket" {
  value = aws_s3_bucket.bucket.id
}

output "secret" {
  value = aws_secretsmanager_secret.secret.name
}
