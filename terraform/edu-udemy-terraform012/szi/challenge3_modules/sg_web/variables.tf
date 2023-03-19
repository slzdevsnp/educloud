variable "ingress" {
  type    = list(number)
  default = [22, 80, 443]
}

variable "egress" {
  type    = list(number)
  default = [22, 80, 443]
}
