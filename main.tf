terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.17.0"
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = "1.60.0"
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

resource "awscc_rds_db_instance" "main_db" {
  db_name = "jetbrains_product_version"
  engine = "postgres"

  allocated_storage = "20"

  db_instance_class = "db.t4g.micro"

  master_username = "nawaphon"
  master_user_password = true
}