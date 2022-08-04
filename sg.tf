resource "aws_security_group" "LG_SG" {
  vpc_id = aws_vpc.LG_VPC.id

  # dynamic "ingress" {
  #   for_each = var.sg_tcp_ports
  #   iterator = port
  #   content {
  #     from_port   = port.value
  #     to_port     = port.value
  #     protocol    = "tcp"
  #     cidr_blocks = ["10.1.0.0/16"]
  #   }
  # }

  # dynamic "ingress" {
  #   for_each = var.sg_udp_ports
  #   iterator = port
  #   content {
  #     from_port   = port.value
  #     to_port     = port.value
  #     protocol    = "udp"
  #     cidr_blocks = ["10.1.0.0/16"]
  #   }
  # }

  # ingress {
  #   from_port   = 1024
  #   to_port     = 65535
  #   protocol    = "tcp"
  #   cidr_blocks = ["10.1.0.0/16"]
  # }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["174.92.43.191/32"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["174.92.43.191/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "LG_SG"
  }
}