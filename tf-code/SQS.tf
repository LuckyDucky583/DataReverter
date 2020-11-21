
resource "aws_s3_bucket_notification" "bucket_terraform_notification" {
  bucket = aws_s3_bucket.dataBucket.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_copy_reversed_data_function.arn
    events = ["s3:ObjectCreated:*"]
  }

  depends_on = [ aws_lambda_permission.allow_terraform_bucket ]
}
