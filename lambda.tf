resource "aws_lambda_function" "lambda" {
  function_name = "${var.lambda_name}-${var.env}"
  role          = aws_iam_role.lambda.arn

  description = var.lambda_description

  s3_bucket         = var.s3_bucket_name
  s3_key            = var.s3_key
  s3_object_version = var.s3_lambda_version

  handler = var.handler

  timeout     = var.timeout
  memory_size = var.memory_size

  runtime = var.runtime

  architectures = var.architectures

  dead_letter_config {
    target_arn = var.dlq_sqs_arn
  }

  dynamic "vpc_config" {
    for_each = var.security_group_ids != null && var.subnet_ids != null ? [1] : []
    content {
      security_group_ids = var.security_group_ids
      subnet_ids         = var.subnet_ids
    }

  }

  environment {
    variables = {
      ConnectionString = "ignore"
      Environment      = var.env
    }
  }

  lifecycle {
    ignore_changes = [environment.0.variables["ConnectionString"]]
  }
}

resource "aws_lambda_event_source_mapping" "sqs" {
  event_source_arn = var.sqs_arn
  function_name    = aws_lambda_function.lambda.arn
}
