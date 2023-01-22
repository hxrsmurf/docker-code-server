resource "aws_iam_user" "user" {
  name = "code-server-tf"
  path = "/"
}

resource "aws_iam_user_policy_attachment" "policy-attachment" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_access_key" "key" {
  user    = aws_iam_user.user.name
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