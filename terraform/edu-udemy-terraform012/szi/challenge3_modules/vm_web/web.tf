
resource "aws_instance" "web" {
    ami = var.amazon_linux2_kerne6_1_ami
    instance_type = "t2.micro"
    security_groups = [module.sg.sg_name]
    user_data = file("./vm_web/server-script.sh")
    tags = {
        Name = "Web Server modularized"
    }
}

output "pub_ip" {
    value = module.eip.PublicIP
}

#calling a module from module
module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}

module "sg" {
    source = "../sg_web"
}