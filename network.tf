resource "aws_internet_gateway" "LG_VPC_IGW" {
  vpc_id = aws_vpc.LG_VPC.id
  tags = {
    Name = "LG_VPC_IGW"
  }
}

resource "aws_route_table" "LG_Pub_RT" {
  vpc_id = aws_vpc.LG_VPC.id

  route {
    cidr_block = var.Any_IPs
    gateway_id = aws_internet_gateway.LG_VPC_IGW.id
  }

  tags = {
    Name = "LG_Pub_RT"
  }
}
resource "aws_route_table_association" "LG_RT_A_Subnet_1" {
  subnet_id      = aws_subnet.LG_VPC_subnet_1.id
  route_table_id = aws_route_table.LG_Pub_RT.id
}

