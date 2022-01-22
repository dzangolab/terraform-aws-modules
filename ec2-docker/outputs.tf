output "instance_ip" {
  description = "The instance's public ipv4 adress -- DEPRECATED: Use `public_ip` instead."

  value = [data.aws_eip.elastic_ip.public_ip]
}

output "private_ip" {
  description = "The instance's private ipv4 address"

  value = [aws_instance.instance.private_ip]
}

output "public_ip" {
  description = "The instance's public ipv4 address"

  value = [data.aws_eip.elastic_ip.public_ip]
}

resource "local_file" "ansible_inventory" {
  content = templatefile(
    var.ansible_inventory,
    {
      name      = var.name
      public_ip = data.aws_eip.elastic_ip.public_ip
      username  = var.username
    }
  )
  filename = "hosts"
}

resource "local_file" "swarm_init" {
  content = templatefile(
    "templates/swarm_init.tmpl",
    {
      private_ip = aws_instance.instance.private_ip
    }
  )
  filename = "swarm_init.yml"
}
