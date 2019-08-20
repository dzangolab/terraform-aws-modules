resource "aws_security_group" "efs" {
  name = "${var.swarm_name}-efs-security-group"
  vpc_id = aws_vpc.main.id

  ingress {
    cidr_blocks = [var.vpc_cidr]
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
  }

  egress {
    cidr_blocks = [var.vpc_cidr]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}
