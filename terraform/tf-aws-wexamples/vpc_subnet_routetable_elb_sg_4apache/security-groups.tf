resource "aws_security_group" "webservers" {
  name = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id = aws_vpc.terra_vpc.id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_web
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "web in terra"
  }
}
