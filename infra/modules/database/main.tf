# One row per tender. Pay-per-request means so it costs nothing when idle.
resource "aws_dynamodb_table" "tenders" {
  name         = "${var.name_prefix}-tenders"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "tender_id"

  attribute {
    name = "tender_id"
    type = "S"
  }
}