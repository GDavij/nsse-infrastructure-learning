resource "aws_dynamodb_table" "this" {
    name = var.remote_backend.stateLocking.dynamodb_table.lock_table_name
    billing_mode = var.remote_backend.stateLocking.dynamodb_table.billing_mode
    hash_key = var.remote_backend.stateLocking.dynamodb_table.hash_key

    attribute {
      name = var.remote_backend.stateLocking.attribute.name
      type = var.remote_backend.stateLocking.attribute.type
    }
}
