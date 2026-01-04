resource "aws_dynamodb_table" "terraform-dynamodb-table" {
  name           = "${var.env}-terraform_dynamodb-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "${var.env}-LockID"

  attribute {
    name = "UserId"
    type = "S"
  }

  tags = {
    Name        = "${var.env}-terraform-dynamodb-table"
    Environment = "${var.env}-env"
  }
}