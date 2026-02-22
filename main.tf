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
  tags = {
    "Name": "jetbrains observe vpc"
  }
}

resource "aws_subnet" "subnet01" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet[0]

  availability_zone = "ap-southeast-1a"
}

resource "aws_subnet" "subnet02" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet[1]

  availability_zone = "ap-southeast-1b"
}

resource "aws_subnet" "subnet03" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet[2]

  availability_zone = "ap-southeast-1c"
}

resource "awscc_rds_db_subnet_group" "db_subnet" {
  db_subnet_group_description = "This is for db subnet"
  subnet_ids = [aws_subnet.subnet01.id]

  db_subnet_group_name = "Main RDS Subnets"
}

resource "awscc_rds_db_instance" "main_db" {
  db_name = "jetbrains_product_version"
  engine = "postgres"

  allocated_storage = "20"

  db_instance_class = "db.t4g.micro"

  master_username = "nawaphon"
  master_user_password = true

  db_subnet_group_name = awscc_rds_db_subnet_group.db_subnet.db_subnet_group_name
  multi_az = false
}