This folder contains terraform projects from terraform12steps udemy course https://www.udemy.com/course/terraform-fast-track/


important folders:
- first-resource
- challenge1-vpc
- challenge2-ec2
- challenge3-modules

CORE_CASES contains symlinks
- first-resource
- challenge3-modules
- rds


terraform learning projects:

# Challenges

## first_resource
hello world in tf on vpc

## variables
* different types of variables

## challenge1_vpc
* refactored hello world with factored out providers.tf, variables.tf

## challenge2_ec2
* create 1 ec2 name db, 2nd websrv ec2 with security groups on list of ports with shell script executed at websrv creation 

## challenge3_modules
* refactor challenge_ec2 with splitting everything in submodules resulting in a short main.tf

## iam
* adds new iam user and custom iam policies, big ec2 write policy is splitting into two
## rds
* creates rds instanced of given type.  (fw security groups aspect is not covered by course )
## backend_backups3
* added backend element to profiders.tf  which copies tfstate file into s3 (needs to have an s3 bucket created first)
## dependency
 * manage an order of execution of different resources
## count_index
 * example of using var.listvariable[count.index] by applying a module with a param from each element in a list variable
## env_vars 
* example of running terraform plan|apply -var-file=prod.tfvars
## import_under_tf_control
 * how to import existing aws resource  by running terraform import
## data_source
  * how to query aws for existing resources and output its attributes
