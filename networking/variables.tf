variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
}

variable "assume_role" {
  type = object({
    role_arn    = string,
    external_id = string
  })
  description = "The IAM role to assume for AWS API calls"
}


variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to resources"
}

variable "remote_backend" {
  type = object({
    bucket_name = string
  })
}

variable "vpc" {
  type = object({
    name                    = string
    cidr_block              = string
    public_route_table_name = string
    private_route_table_name = string
    public_internet_gateway_name = string
    public_nat_gateway_name = string
    elastic_ip_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
}

variable "internet_gateway" {
  type = object({
    name = string
  })
}
