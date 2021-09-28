output "arn" {
  description = "The ARN of the bucket. Will be of format `arn:aws:s3:::bucketname`."
  value = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
  description = "The bucket domain name. Will be of format `bucketname.s3.amazonaws.com`."
  value = aws_s3_bucket.this.id
}

output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name."
  value = aws_s3_bucket.this.id
}

output "id" {
  description = "The name of the bucket."
  value = aws_s3_bucket.this.id
}

output "policy_arn" {
  description = "The ARN assigned by AWS to the bucket policy."
  value = aws_iam_policy.bucket_policy.arn
}

output "policy_id" {
  description = "The ID of the bucket policy."
  value = aws_iam_policy.bucket_policy.arn
}

output "policy_name" {
  value = aws_iam_policy.bucket_policy.name
}

output "region" {
  description = "The AWS region this bucket resides in."
  value = aws_s3_bucket.this.region
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider `default_tags` configuration block."
  value = aws_s3_bucket.this.tags_all
}