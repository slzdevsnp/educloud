#modules allow to break up main.tf

module "db" {
    source = "./vm_db"   
}

module "web" {
    source = "./vm_web"  
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.web.pub_ip
}
