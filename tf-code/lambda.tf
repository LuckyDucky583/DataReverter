/*
data "aws_s3_bucket_object" "reverse_data_lambda_function_hash" {
  bucket = "bucket-for-lambda-zips"
  key    = "path/reverse_data_lambda_function_payload.zip.base64sha256"
}
*/
resource "aws_lambda_function" "s3_copy_reversed_data_function" {
  filename = "lambda.zip"
  source_code_hash = data.archive_file.my_lambda_function.output_base64sha256
  function_name = "${var.env_name}_s3_copy_reversed_data_lambda"
  role = aws_iam_role.s3_copy_function.arn
  handler = "index.handler"
  runtime = "python3.7"

  environment {
    variables = {
      DST_BUCKET = "${var.env_name}-dst-bucket",
      REGION = var.region
    }
  }
}

data "archive_file" "my_lambda_function" {
  source_dir  = "lambda/"
  output_path = "lambda/lambda.zip"
  type        = "zip"
}

