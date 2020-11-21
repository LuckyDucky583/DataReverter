resource "aws_lambda_function" "s3_copy_reversed_data_function" {
  filename = "lambda/s3_copy_reversed_data_lambda.zip"
  source_code_hash = data.archive_file.my_lambda_function.output_base64sha256
  function_name = "s3_copy_reversed_data_lambda"
  role = aws_iam_role.s3_copy_function.arn
  handler = "s3_copy_reversed_data_lambda.handler"
  runtime = "python3.7"

  environment {
    variables = {
      DST_BUCKET = "reversebucket58366",
      REGION = var.region
    }
  }
}

data "archive_file" "my_lambda_function" {
  source_dir  = "lambda/"
  output_path = "lambda/s3_copy_reversed_data_lambda.zip"
  type        = "zip"
}

