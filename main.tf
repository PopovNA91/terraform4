provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "Ubuntu" {
  ami = "ami-03d5c68bab01f3496"
  instance_type = "t3.micro"
  tags = {
    Name = "Ubuntu_netology"
    Owner = "Popov Nikolay"
    Project = "Terraform homework"
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
