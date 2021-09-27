output "arn" {
  description = "The volume ARN (e.g. arn:aws:ec2:us-east-1:0123456789012:volume/vol-59fcb34e)."
  value       = aws_ebs_volume.this.arn
}

output "availability_zone" {
  description = "The volume's availability zone"
  value       = aws_ebs_volume.this.availability_zone
}

output "az" {
  description = "The volume's availability zone"
  value       = aws_ebs_volume.this.availability_zone
}

output "id" {
  description = "The volume ID (e.g. vol-59fcb34e)."
  value       = aws_ebs_volume.this.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_ebs_volume.this.tags_all
}