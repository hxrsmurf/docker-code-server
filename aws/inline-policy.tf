data "aws_iam_policy_document" "inline_policy" {
  policy_id = "IAM-TF"
  statement {
    actions = [
      "iam:GetUserPolicy",
      "iam:ListAttachedUserPolicies",
      "iam:GetRole",
      "iam:GetRolePolicy",
      "iam:ListRolePolicies",
      "iam:ListAttachedRolePolicies"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
        "iam:*"
    ]
    resources = [aws_iam_user.user.arn]
  }
}
