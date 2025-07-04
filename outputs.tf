output "org_read_role" {
  description = "ARN for the account-discovery role assumed by Stacklet Platform."
  value       = aws_iam_role.org_read.arn
}
