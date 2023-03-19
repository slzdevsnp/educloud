resource "aws_instance" "db" {
    ami = var.amazon_linux2_kerne6_1_ami
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}

output "PrivateIP" {
    value = aws_instance.db.private_ip
}