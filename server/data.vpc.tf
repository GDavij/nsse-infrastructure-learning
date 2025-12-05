# Data that exists in other Terraform but not in the current.


data "aws_vpc" "this" {
    filter {
      name = "tag:Name"
      values = [var.vpc_resources.vpc_name]
    }
}