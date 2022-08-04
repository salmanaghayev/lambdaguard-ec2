variable "sg_tcp_ports" {
  type        = list(number)
  description = "ingress ports"
  default     = [53, 88, 135, 139, 389, 445]
}

variable "sg_udp_ports" {
  type        = list(number)
  description = "ingress ports"
  default     = [53, 88, 123, 137, 138, 389, 445]
}

variable "domain_name" {
  type = string
  default = "lg.test.website"
}

# variable "peer_owner_id" {
#   type        = number
#   description = "Peer Account ID"
#   default     = "813234481361"
# }

# variable "SSO_VPC" {
#   type        = string
#   description = "Peer VPC ID"
#   default     = "vpc-01228b117e4d0836d"
# }

/*
data "aws_vpc_peering_connection" "SSO_PCX" {
  vpc_id          = aws_vpc.LG_VPC.id
  peer_cidr_block = "10.1.0.0/16"
}

data "aws_vpc_peering_connection" "SSO_PCX" {

  peer_cidr_block = "10.1.0.0/16"

  filter {
    name   = "tag-value"
    values = ["SSO_PCX"]
  }
}
*/