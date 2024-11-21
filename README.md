# terraform-aws-lambda-eventhub
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.sqs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.lambda_vpc_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_event_source_mapping.sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_event_source_mapping) | resource |
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dlq_sqs_arn"></a> [dlq\_sqs\_arn](#input\_dlq\_sqs\_arn) | The dlq SQS arn which shall be used | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | Handler of the lambda function | `string` | n/a | yes |
| <a name="input_lambda_description"></a> [lambda\_description](#input\_lambda\_description) | n/a | `string` | n/a | yes |
| <a name="input_lambda_name"></a> [lambda\_name](#input\_lambda\_name) | Name of your lambda | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | S3 Bucket name where the lambda code is uploaded | `string` | n/a | yes |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | Path to the lambda code in the s3 bucket | `string` | n/a | yes |
| <a name="input_s3_lambda_version"></a> [s3\_lambda\_version](#input\_s3\_lambda\_version) | The version id of the lambda from the s3 bucket | `string` | n/a | yes |
| <a name="input_sqs_arn"></a> [sqs\_arn](#input\_sqs\_arn) | The SQS arn which shall be used | `string` | n/a | yes |
| <a name="input_architectures"></a> [architectures](#input\_architectures) | Valid values are ["x86\_64"] and ["arm64"] | `list(string)` | <pre>[<br>  "arm64"<br>]</pre> | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | Memory size | `number` | `256` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime of the lambda function | `string` | `"dotnet8"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Only specify if you want to run the lambda in a VPC | `set(string)` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Only specify if you want to run the lambda in a VPC | `set(string)` | `null` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Timeout of the lambda function | `number` | `30` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->