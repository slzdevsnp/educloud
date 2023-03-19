

resource "aws_instance" "web" {
    ami = var.amazon_linux2_kernel5_10_ami
    instance_type = "t2.micro"
    tags ={
        Name = "Web Server"
    }
    depends_on = [aws_instance.db]
}

resource "aws_instance" "db" {
    ami = var.amazon_linux2_kernel5_10_ami
    instance_type = "t2.micro"
    tags ={
        Name = "DB Server"
    }
}

data "aws_instances" "srv_search" {
    filter {
        name = "tag:Name"
        values = ["DB Server", "Web Server"]
    }
    instance_state_names = ["running", "stopped"]
}

output "found_servers" {
    value = data.aws_instances.srv_search.private_ips
}