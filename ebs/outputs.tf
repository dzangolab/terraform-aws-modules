output "az" {
  value = aws_ebs_volume.this.availability_zone
}

output "id" {
  value = aws_ebs_volume.this.id
}

output "arn" {
  value = aws_ebs_volume.this.arn
}
