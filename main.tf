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