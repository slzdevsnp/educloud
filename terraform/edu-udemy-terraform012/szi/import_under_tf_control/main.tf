resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

##uncomment below before running  terraform import aws_vpc.myvpc_bis
# resource "aws_vpc" "myvpc_bis" {
#     cidr_block = "192.168.0.0/24"
# }