provider "aws" {
  region = "eu-central-1"
}


variable "vpcname" {
  type    = string
  default = "myvpc"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["Value1", "Value2"]
}

variable "mymap" {
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

output "mymap" {
  value = var.mymap["Key2"]
}


variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({ name = string, port = list(number) })
  default = {
    name = "TJ"
    port = [22, 25, 80]
  }
}
#added my output 
output "myobject_value1" {
    value = var.myobject
}

#list of objects
variable "objects" {
  type = list(object({id = string,attribute = string, age=number}))
  description = "list of objects"
  default = [
      {
        id = "name1"
        attribute = "a"
        age=11
      },
      {
        id = "name2"
        attribute = "a|b"
        age=12
      },
      {
        id = "name3"
        attribute = "d"
        age=13
      }
  ]
}

output "objects1"{
  value = var.objects[0].id
}
output "objects2"{
  value = var.objects[0].attribute
}
output "objects3"{
  value = var.objects[0].age+100
}

variable x_pos {
  type=number 
  default = 11
}
variable y_pos {
  type=number 
  default = 12
}
output xandy{
  value = var.x_pos + var.y_pos
}


