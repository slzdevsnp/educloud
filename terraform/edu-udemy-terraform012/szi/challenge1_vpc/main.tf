


resource "aws_vpc" "challenge1vpc" {
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = var.vpcname
    }
}