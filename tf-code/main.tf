provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

resource "aws_dynamodb_table" "terraform_locks" {
  hash_key     = "LockID"
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    region  = "eu-central-1"
    profile = "default"
    key     = "terraformstatefile"
    bucket  = "terraformstatebucket58366"

    dynamodb_table = "terraform_locks"
    encrypt = true
  }
}