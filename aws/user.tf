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