variable "env" {
  type = string
}

variable "sqs_arn" {
  type        = string
  description = "The SQS arn which shall be used"
}

variable "dlq_sqs_arn" {
  type        = string
  description = "The dlq SQS arn which shall be used"
}

variable "security_group_ids" {
  type        = set(string)
  description = "Only specify if you want to run the lambda in a VPC"
  default     = null
}

variable "subnet_ids" {
  type        = set(string)
  description = "Only specify if you want to run the lambda in a VPC"
  default     = null
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 Bucket name where the lambda code is uploaded"
}

variable "s3_key" {
  type        = string
  description = "Path to the lambda code in the s3 bucket"
}

variable "s3_lambda_version" {
  type        = string
  description = "The version id of the lambda from the s3 bucket"
}

variable "lambda_name" {
  type        = string
  description = "Name of your lambda"
}

variable "lambda_description" {
  type        = string
  description = ""
}

variable "handler" {
  type        = string
  description = "Handler of the lambda function"
}

variable "architectures" {
  type        = list(string)
  description = "Valid values are [\"x86_64\"] and [\"arm64\"]"
  default     = ["arm64"]
}

variable "runtime" {
  type        = string
  description = "Runtime of the lambda function"
  default     = "dotnet8"
}

variable "timeout" {
  type        = number
  description = "Timeout of the lambda function"
  default     = 30
}

variable "memory_size" {
  type        = number
  description = "Memory size"
  default     = 256
}
