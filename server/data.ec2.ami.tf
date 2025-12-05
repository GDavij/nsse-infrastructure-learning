data "aws_ami" "this" {
  most_recent      = true
  name_regex       = "^myami-[0-9]{3}"
  owners           = ["679593333241"]

  filter {
    name   = "name"
    values = [" (SupportedImages) - Debian 11 x86_64 LATEST - 20240506-1d35fd93-1375-479d-a829-cb24bdae25fd"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}
