output "role" {
  value = {
    "arn" : aws_iam_role.role.arn,
    "url" : "https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/roles/details/${aws_iam_role.role.name}"
  }
}

output "secret" {
  value = aws_iam_access_key.key.secret
  sensitive = true
}

output "user" {
  value = {
    "url" = "https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/users/details/${aws_iam_user.user.name}"
  }
}