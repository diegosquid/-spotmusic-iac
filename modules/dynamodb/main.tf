resource "aws_dynamodb_table" "spotmusic_dynamodb" {
 name     = var.dynamodb_table_name
 billing_mode = "PROVISIONED"
 read_capacity = 5
 write_capacity = 5
 hash_key   = "ID"
 attribute {
  name = "ID"
  type = "S"
 }
}

output "table_name" {
  value = aws_dynamodb_table.spotmusic_dynamodb.name
}