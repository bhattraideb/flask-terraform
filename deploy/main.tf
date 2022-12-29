# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "skeleton" {
  ami             = "ami-0b5eea76982371e91"
  instance_type   = "t2.micro"
  key_name        = "my-ubuntu-key"
  security_groups = [aws_security_group.web.name]
  tags = {
    Name = "SkeletonAppByTerraform"
  }
}

resource "aws_security_group" "web" {
  name        = "walking-skeleton-security-group"
  description = "Security Group for my Flask Walking Skeleton App"

  tags = {
      Name = "SkeletonApp"
    }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    description = "Allow SSH"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_public_dns" {
  value = aws_instance.skeleton.public_dns
}
