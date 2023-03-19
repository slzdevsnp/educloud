resource "aws_instance" "webservers" {
	count = length(var.subnets_cidr) 
	ami = var.amazon_linux2_kernel5_10_ami
	instance_type = var.websrv_instance_type
	security_groups = [aws_security_group.webservers.id]
	subnet_id = element(aws_subnet.public.*.id,count.index)
	user_data = file("install_httpd.sh")

	tags = {
	  Name = "websrv-${count.index}"
	}
}