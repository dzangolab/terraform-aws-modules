output "arn" {
  description = "The ARN of the instance."
  value       = aws_instance.bastion.arn
}

output "instance_state" {
  description = "The state of the instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`. See [Instance Lifecycle](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html) for more information."
  value       = aws_instance.bastion.instance_state
}

output "private_ip" {
  description = "The private IP address assigned to the instance. "
  value       = aws_instance.bastion.private_ip
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. "
  value       = aws_instance.bastion.public_ip
}

