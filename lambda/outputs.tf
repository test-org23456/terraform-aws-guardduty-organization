output "aws_region" {
  value = var.aws_region
}

output "function" {
  value = aws_lambda_function.guardduty_to_slack
}

