data "aws_vpc" "vpc_available" {
  filter {
    name   = "tag:Name"
    values = ["my_vpc"]
  }
}
data "aws_subnets" "available_db_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_available.id]
  }
  filter {
    name   = "tag:Name"
    values = ["my_database*"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
data "aws_security_group" "my_secgrp" {
  filter {
    name   = "tag:Name"
    values = ["my_security_group"]
  }
}

