resource "aws_security_group" "LG_SG" {
  vpc_id = aws_vpc.LG_VPC.id

  dynamic "ingress" {
    for_each = var.sg_tcp_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.SSH_HTTP_Allowed_IPs
    }
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.Any_IPs]
  }
  tags = {
    Name = "LG_SG"
  }
}