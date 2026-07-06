terraform { required_providers { aws = { source = "hashicorp/aws" version = "~> 5.0" }
random = { source = "hashicorp/random" version = "~> 3.0" } } } provider "aws" { region =
"us-east-1" } resource "random_id" "suffix" { byte_length = 4 } resource "aws_instance"
"nike_ec2" { ami = "ami-0953476d60561c955" # Amazon Linux 2023, us-east-1 instance_type
= "t2.micro" tags = { Name = "nike-terraform-ec2" Project = "Nike DevOps Assessment" } }
resource "aws_s3_bucket" "nike_bucket" { bucket =
"nike-devops-bucket-${random_id.suffix.hex}" tags = { Name = "nike-devops-bucket"
Project = "Nike DevOps Assessment" } }
