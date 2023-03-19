





resource "aws_db_instance" "myRDS" {
    db_name = "mypsg"
    identifier = "my-first-psg-rds"
    instance_class = "db.t3.micro"
    engine = "postgres"
    engine_version = "14.1"
    username = "postgres"
    password = "abvgdjka"
    port = 5432
    allocated_storage = 20
    skip_final_snapshot = true
}


