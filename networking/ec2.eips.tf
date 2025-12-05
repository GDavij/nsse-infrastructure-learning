resource "aws_eip" "this" {
  count = length(aws_subnet.public)

  domain = "vpc"
  
}