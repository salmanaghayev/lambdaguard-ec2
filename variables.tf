variable "sg_tcp_ports" {
  type        = list(number)
  description = "ingress ports"
  default     = [22, 80]
}

variable "domain_name" {
  type = string
  default = "lg.test.website"
}

variable "SSH_HTTP_Allowed_IPs" {
  type        = list
  description = "Whitelisted IPs for SSH and HTTP access to EC2"
  default     = ["1.1.1.1/32"]
}

variable "LG_VPC_CIDR" {
  description = "LG VPC CIDR block"
  default     = "10.0.0.0/16"
}
variable "LG_VPC_subnet_1" {
  description = "LG VPC Subnet1 CIDR block"
  default     = "10.0.0.0/24"
}
variable "LG_VPC_subnet_2" {
  description = "LG VPC Subnet1 CIDR block"
  default     = "10.0.1.0/24"
}
variable "Any_IPs" {
  description = "Any IP address"
  default     = "0.0.0.0/0"
}