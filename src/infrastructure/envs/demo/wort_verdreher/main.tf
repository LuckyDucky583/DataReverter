module "s3_data_reverser" {
  source              = "../../../modules/s3_data_reverse"
  env                 = var.env
  lambda_archive_path = var.lambda_archive_path
  region              = var.region
}

resource "aws_dynamodb_table" "terraform_locks" {
  hash_key       = "LockID"
  name           = "terraform-locks"
  billing_mode   = "PAY_PER_REQUEST"
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}

