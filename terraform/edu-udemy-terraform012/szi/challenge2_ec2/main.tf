


resource "aws_instance" "db" {
  ami           = var.amazon_linux2_kernel5_10_ami
  instance_type = "t2.micro"

  tags = {
    Name = "DB Server"
  }
}


resource "aws_instance" "web" {
  ami             = var.amazon_linux2_kernel5_10_ami
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]
  user_data       = file("server-script_websrv.sh")
  tags = {
    Name = "Web Server"
  }
}

resource "aws_eip" "web_ip" {
  instance = aws_instance.web.id
}


resource "aws_security_group" "web_traffic" {
  name = "Allow Web Traffic"
  
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      from_port   = port.value
      to_port     = port.value + port.key
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      description = join("", ["descr:",tostring(port.key)])
    }
  }
  
  ## this is preferred for security
  # egress {
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "-1"
  #   cidr_blocks      = ["0.0.0.0/0"]
  #   ipv6_cidr_blocks = ["::/0"]
  # }


# it is more secure to restrict outbound traffic as well
  dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "allow web requests"
  }

}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}

output "PublicIP" {
  value = aws_eip.web_ip.public_ip
}
