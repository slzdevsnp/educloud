resource "aws_instance" "db" {
    ami = var.amazon_linux2_kernel5_10_ami
    instance_type = "t2.micro"
}

resource "aws_instance" "web" {
    ami = var.amazon_linux2_kernel5_10_ami
    instance_type = "t2.micro"

    depends_on = [aws_instance.db]
}