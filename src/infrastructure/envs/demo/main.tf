module "s3_data_reverser" {
  source              = "../../modules/s3_data_reverse"
  env                 = "demo"
  lambda_archive_path = "../../../lambda"
  region              = "eu-central-1"
}

