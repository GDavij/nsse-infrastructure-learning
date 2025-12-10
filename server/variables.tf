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

variable "ec2_resources" {
  type = object({
    key_pair_name    = string
    instance_profile = string
    instance_role    = string
    ssh_security_group = string
    ssh_source_ipv4 = string
    ssh_source_ipv6 = string
  })

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


variable "vpc_resources" {
    type = object({
      vpc_name = string
    })
}

variable "control_plane_launch_template" {
  type = object({
    name = string
    instance_type = string
    disable_api_stop        = bool
    disable_api_termination = bool
    instance_initiated_shutdown_behavior = string
    ebs = object({
      size = number
      delete_on_termination = bool
    })
  })
}

variable "control_plane_autoscaling_group" {
  type = object({
    name                        = string
    min_size                    = number
    max_size                    = number
    desired_capacity            = number
    health_check_grace_period   = number
    health_check_type           = string
    instance_maintenance_policy = object({
      min_healthy_percentage = number
      max_healthy_percentage = number
    })
  })
}