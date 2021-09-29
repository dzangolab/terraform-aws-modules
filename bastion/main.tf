resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "bastion security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "Bastion SSH-only security group"
  }
}

resource "aws_security_group_rule" "ingress" {
  description       = "Allow SSH ingress"
  security_group_id = aws_security_group.bastion.id
  type              = "ingress"

  from_port = 22
  to_port   = 22
  protocol  = "tcp"

  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

resource "aws_security_group_rule" "egress" {
  description       = "Allow egress to all ports"
  security_group_id = aws_security_group.bastion.id
  type              = "egress"

  from_port = 0
  to_port   = 0
  protocol  = -1

  cidr_blocks      = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
}

resource "aws_key_pair" "bastion" {
  key_name   = var.name
  public_key = file(var.key_path)
}

resource "aws_instance" "bastion" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  disable_api_termination     = var.disable_api_termination
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.bastion.id
  monitoring                  = var.monitoring
  subnet_id                   = var.subnet_id
  user_data = templatefile(var.user_data, {
    groups   = join(",", var.user_groups)
    packages = var.packages
    ssh_keys = var.ssh_keys
    username = var.username
  })
  vpc_security_group_ids = aws_security_group.bastion.id

  tags = merge({ "Name" : var.name }, var.tags)
}
