variable "aws_region" {
	default = "eu-central-1"
}

variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "vpc_name" {
    default = "TerraVpc"
}

variable "subnets_cidr" {
	type = list
	default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "azs" {
	type = list
	default = ["eu-central-1a", "eu-central-1b"]
}

variable "ingress_web" {
    type = list(number)
    default = [80,443]
}


variable "amazon_linux2_kernel5_10_ami" {
  type    = string
  default = "ami-0006ba1ba3732dd33"
}

variable "websrv_instance_type" {
  default = "t2.nano"
}

