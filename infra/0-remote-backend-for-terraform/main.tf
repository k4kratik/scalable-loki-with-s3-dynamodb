provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-storage-bucket-${var.account_id}"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "Bucket-for-Terraform-State"
    Environment = "Dev"
    Owner       = "Kratik Jain"
  }

}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-state-dynamodb-table"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
