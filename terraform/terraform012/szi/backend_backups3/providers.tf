terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version =">=4.12.1"
        }
    }

       backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "sz-remote-backup-tf"
        region = "eu-central-1"

    } 
}

provider "aws" {
        region = var.aws_region
}
