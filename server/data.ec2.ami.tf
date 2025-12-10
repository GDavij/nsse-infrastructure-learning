data "aws_ami" "this" {
  most_recent      = true

  filter {
    name   = "image-id"
    values = ["ami-0f9c27b471bdcd702"]
  }
}
