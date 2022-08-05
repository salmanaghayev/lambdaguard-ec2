resource "aws_vpc" "LG_VPC" {
  cidr_block           = var.LG_VPC_CIDR
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = {
    Name = "LG_VPC"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "LG_VPC_subnet_1" {
  vpc_id                  = aws_vpc.LG_VPC.id
  cidr_block              = var.LG_VPC_subnet_1
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "LG_VPC_subnet_1"
  }
}

resource "aws_subnet" "LG_VPC_subnet_2" {
  vpc_id                  = aws_vpc.LG_VPC.id
  cidr_block              = var.LG_VPC_subnet_2
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "LG_VPC_subnet-2"
  }
}
