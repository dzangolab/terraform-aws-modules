output "instance_ip" {
  description = "The instance's public ipv4 adress"

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

