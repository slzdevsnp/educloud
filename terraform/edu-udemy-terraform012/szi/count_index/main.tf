#call module for each value in list
module "db" {
    source = "./db"
    server_names = ["mariadb","mysql","mssql"]
}

output "private_ips" {
    value = module.db.PrivateIP
}