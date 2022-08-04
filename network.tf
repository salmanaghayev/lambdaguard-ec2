/*resource "aws_vpc_peering_connection" "SSO_VPC_PCX" {
  peer_owner_id = var.peer_owner_id
  peer_vpc_id   = var.SSO_VPC
  vpc_id        = aws_vpc.LG_VPC.id
  peer_region   = "us-east-1"
}
*/


resource "aws_internet_gateway" "LG_VPC_IGW" {
  vpc_id = aws_vpc.LG_VPC.id
  tags = {
    Name = "LG_VPC_IGW"
  }
}

resource "aws_route_table" "LG_Pub_RT" {
  vpc_id = aws_vpc.LG_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.LG_VPC_IGW.id
  }

  # route {
  #   cidr_block                = "10.1.0.0/16"
  #   vpc_peering_connection_id = "pcx-01340c05ddc4e193e"
  # }

  tags = {
    Name = "LG_Pub_RT"
  }
}
resource "aws_route_table_association" "LG_RT_A_Subnet_1" {
  subnet_id      = aws_subnet.LG_VPC_subnet_1.id
  route_table_id = aws_route_table.LG_Pub_RT.id
}

