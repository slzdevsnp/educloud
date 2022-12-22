url: 
https://www.bogotobogo.com/DevOps/Terraform/Terraform-VPC-Subnet-ELB-RouteTable-SecurityGroup-Apache-Server-1.php

git:  https://github.com/Einsteinish/Terraform-Turotials.git    VPC-LoadBalancer


this tutorial creates:
* vpc with 2 vpc subnets in 2 subnets 
    * each subnet in its own AZ
    * has 1 ec2 with apache serv
* each ec2 has security group
* elb for 2 ec2 instances


stage 1. 
create files  provifers.tf, variables.tf and vpc.tf , hit tf apply


stage 2. 
create instances.tf  and install_httpd.sh, hit tf apply, 
you can check both http with curl http://public_ip_inst{1,2}

stage 3 elb
creat  elb.tf   , check with curl  http://elb-dns-record
files:
```txt
$ tree VPC-LoadBalancer
VPC-LoadBalancer/
├── elb.tf
├── install_httpd.sh
├── instances.tf
├── provider.tf
├── security-groups.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── variables.tf
└── vpc.tf
```

