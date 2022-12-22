variable "aws_region" {
  default = "eu-central-1"
}

# variable "vpc_back" {
#   default = "backend"
# }

# variable "vpc_back_cidr" {
#   default = "10.1.0.0/16"
# }

# variable "vpc_back_private_subnet_a" {
#   default = "10.1.99.0/24"
# }

# variable "vpc_back_private_subnet_b" {
#   default = "10.1.98.0/24"
# }

variable "psgport" {
  default = "5432"
}
