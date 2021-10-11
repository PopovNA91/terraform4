provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "bucketnetology"
    key = "path/to/my/key"
    region = "us-west-2"
  }
}

locals {
  ubuntu_instance_count = {
    stage = 1
    prod = 2
  }
  
  ubuntu_instance_type = {
    stage = "t3.micro"
    prod = "t3.large"
  }
  
  type_count = {
    stage = "t3.micro"
    prod = "t3.large"
  }
}

resource "aws_instance" "Ubuntu" {
  ami = "ami-03d5c68bab01f3496"
  instance_type = local.ubuntu_instance_type[terraform.workspace]
  count = local.ubuntu_instance_count[terraform.workspace]
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "Ubuntu_netology"
    Owner = "Popov Nikolay"
    Project = "Terraform homework"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  for_each = local.type_count
  name = "CentOS-${each.key}"
  ami                    = "ami-0686851c4e7b1a8e1"
  instance_type          = each.value
  tags = {
    Name = "Ubuntu_netology"
    Owner = "Popov Nikolay"
    Project = "Terraform homework"
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
