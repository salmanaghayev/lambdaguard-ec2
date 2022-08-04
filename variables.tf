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
  default     = ["10.0.0.238/32"]
}

variable "Any_IPs" {
  #type        = list
  description = "Any IP address"
  default     = "0.0.0.0/0"
}