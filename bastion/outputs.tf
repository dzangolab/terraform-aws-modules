output "instance_ip" {
  description = "The instance's public ipv4 adress"

  value = [data.aws_eip.elastic_ip.public_ip]
}

