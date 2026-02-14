terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
  }
}


resource "aws_vpc" "vpc" {
  cidr_block = var.CICD
}

resource "aws_subnet" "subnet01" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet[0]
}

resource "aws_subnet" "subnet02" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet[1]
}