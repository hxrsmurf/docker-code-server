resource "aws_iam_user" "user" {
  name = "code-server-tf"
  path = "/"
}

output "user" {
  value = {
    "url" = "https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/users/details/${aws_iam_user.user.name}"
  }
}