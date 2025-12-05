resource "aws_launch_template" "control_plane" {
  name                                  = var.control_plane_launch_template.name
  instance_type                         = var.control_plane_launch_template.instance_type
  image_id                              = data.aws_ami.this.image_id
  instance_initiated_shutdown_behavior  = var.control_plane_launch_template.instance_initiated_shutdown_behavior
  disable_api_stop                      = var.control_plane_launch_template.disable_api_stop
  disable_api_termination               = var.control_plane_launch_template.disable_api_termination
  ebs_optimized                         = false
  key_name                              = aws_key_pair.this.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  
  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size           = var.control_plane_launch_template.ebs.size
      delete_on_termination = var.control_plane_launch_template.ebs.delete_on_termination
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }


  iam_instance_profile {
    name = aws_iam_instance_profile.instance_profile.name
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = false
  }

  tag_specifications {
    resource_type = "instance"
    tags = var.tags
  }

}
