variable "region" {
    type = string
    description = "The AWS region to deploy resources in"
}

variable "assume_role" {
    type = object({
      role_arn = string,
      external_id = string
    })
    description = "The IAM role to assume for AWS API calls"
    # Set in terraform.tfvars (not committed to Git)
}


variable "tags" {
  type = map(string)
  description = "A map of tags to assign to resources"
}

variable "remote_backend" {
    type = object({
      bucket_name = string
      stateLocking = object({
        dynamodb_table = object({
          lock_table_name = string
          billing_mode = string
          hash_key = string
        })

        attribute = object({
          name = string
          type = string 
        })
      })
    })
}