data "aws_eip" "elastic_ip" {
  id = var.eip_allocation_id
}

resource "aws_key_pair" "default" {
  key_name   = var.name
  public_key = file(var.key_path)
}

resource "aws_instance" "this" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  disable_api_termination     = var.disable_api_termination
  iam_instance_profile        = var.instance_profile
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.default.id
  monitoring                  = var.monitoring
  subnet_id                   = var.subnet_id
  user_data = templatefile(var.user_data, {
    groups    = join(",", var.user_groups)
    packages  = var.packages
    ssh_keys  = var.ssh_keys
    username  = var.username
    swap_file = var.swap_file
    swap_size = var.swap_size
  })
  vpc_security_group_ids = var.vpc_security_group_ids

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }

  tags = merge({ "Name" : var.name }, var.tags)
}

resource "aws_eip_association" "elastic_ip_association" {
  instance_id   = aws_instance.this.id
  allocation_id = data.aws_eip.elastic_ip.id

  provisioner "local-exec" {
    when    = destroy
    command = "sed -i -e '/^${self.public_ip} .*/d' ~/.ssh/known_hosts"
  }
}

resource "aws_volume_attachment" "volume_attachment" {
  device_name = "/dev/sdh"
  volume_id   = var.volume_id
  instance_id = aws_instance.this.id

  provisioner "local-exec" {
    when    = destroy
    command = "umount /dev/sdh"
  }  
}
