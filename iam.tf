data "aws_iam_policy_document" "sqs_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sqs:DeleteMessage",
      "sqs:ReceiveMessage",
      "sqs:GetQueueAttributes"
    ]
    resources = [
      var.sqs_arn
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "sqs:SendMessage"
    ]
    resources = [
      var.dlq_sqs_arn
    ]
  }
}


data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name               = "${var.lambda_name}-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_exec" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy" "sqs_policy" {
  role   = aws_iam_role.lambda.id
  name   = "${var.lambda_name}-policy-${var.env}"
  policy = data.aws_iam_policy_document.sqs_policy.json
}


resource "aws_iam_policy" "additional_policy" {
  for_each = { for idx, policy in var.additional_policies : idx => policy }
  name     = "${each.value.name}-${var.env}"
  policy   = each.value.policy
}

resource "aws_iam_role_policy_attachment" "additional_policies" {
  for_each = aws_iam_policy.additional_policy
  role     = aws_iam_role.lambda.name
  policy_arn = each.value.arn
}