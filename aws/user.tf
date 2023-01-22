resource "aws_iam_user" "user" {
  name = "code-server-tf"
  path = "/"
}

resource "aws_iam_user_policy" "policy" {
  name = data.aws_iam_policy_document.inline_policy.policy_id
  policy = data.aws_iam_policy_document.inline_policy.json
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy_attachment" "policy-attachment" {
  user       = aws_iam_user.user.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_access_key" "key" {
  user    = aws_iam_user.user.name
}