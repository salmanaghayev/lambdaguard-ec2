resource "aws_vpc" "LG_VPC" {
  cidr_block           = "10.0.0.0/16"
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
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "LG_VPC_subnet_1"
  }
}

resource "aws_subnet" "LG_VPC_subnet-2" {
  vpc_id                  = aws_vpc.LG_VPC.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "LG_VPC_subnet-2"
  }
}
