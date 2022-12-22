

resource "aws_instance" "ec2" {
    ami = var.amazon_linux2_kernel5_10_ami
    instance_type = "t2.micro"
    count = var.number_of_servers
}