variable "aws_region" {
  default = "eu-central-1"
}


variable "amazon_linux2_kernel5_10_ami" {
  type    = string
  default = "ami-0006ba1ba3732dd33"
}


variable "ingress" {
    type = list(number)
    default = [80,443]
}

variable "egress" {
    type = list(number)
    default = [80,443]
}