output "arn" {
  description = "ARN assigned by AWS to the instance profile."
  value = aws_iam_instance_profile.profile.arn
}

output "create_date" {
  description = "Creation timestamp of the instance profile."
  value = aws_iam_instance_profile.profile.create_date
}

output "id" {
  description = "Instance profile's ID."
  value = aws_iam_instance_profile.profile.id
}

output "name" {
  description = "Instance profile's name."
  value = aws_iam_instance_profile.profile.name
}

output "name_prefix" {
  description = "Instance profile's name prefix."
  value = aws_iam_instance_profile.profile.name
}

output "path" {
  description = "Instance profile's path."
  value = aws_iam_instance_profile.profile.name
}

output "role" {
  description = "Instance profile's role."
  value = aws_iam_instance_profile.profile.name
}

output "tags" {
  description = "Map of resource tags for the IAM Instance Profile."
  value = aws_iam_instance_profile.profile.tags_all
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value = aws_iam_instance_profile.profile.tags_all
}

output "unique_id" {
  description = "Unique ID assigned by AWS."
  value = aws_iam_instance_profile.profile.unique_id
}
