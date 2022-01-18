data "aws_eip" "elastic_ip" {
  id = var.eip_allocation_id
}

resource "aws_key_pair" "default" {
  key_name   = var.name
  public_key = file(var.key_path)
}

resource "aws_instance" "instance" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  disable_api_termination     = var.disable_api_termination
  iam_instance_profile        = var.instance_profile
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.default.id
  monitoring                  = var.monitoring
  subnet_id                   = var.subnet_id
  user_data = templatefile(var.user_data, {
    docker_compose         = var.docker_compose
    docker_compose_version = var.docker_compose_version
    groups                 = join(",", var.user_groups)
    packages               = var.packages
    ssh_keys               = var.ssh_keys
    username               = var.username
    swap_file              = var.swap_file
    swap_size              = var.swap_size
  })
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = merge({ "Name" : var.name }, var.tags)
}

resource "aws_eip_association" "elastic_ip_association" {
  instance_id   = aws_instance.instance.id
  allocation_id = data.aws_eip.elastic_ip.id

  provisioner "local-exec" {
    when    = destroy
    command = "sed -i -e '/^${self.public_ip} .*/d' ~/.ssh/known_hosts"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  count        = length(var.volumes)
  device_name  = lookup(element(var.volumes, count.index), "device")
  instance_id  = aws_instance.instance.id
  volume_id    = lookup(element(var.volumes, count.index, "id")
}
