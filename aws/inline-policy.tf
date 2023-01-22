data "aws_iam_policy_document" "inline_policy" {
  policy_id = "IAM-TF"
  statement {
    actions = [
      "iam:GetUserPolicy",
      "iam:ListAttachedUserPolicies"
    ]
    resources = ["*"]
  }

  statement {
    actions = [
      "iam:GetRole",
      "iam:GetRolePolicy",
      "iam:ListRolePolicies",
      "iam:ListAttachedRolePolicies"
    ]
    resources = [aws_iam_role.role.arn]
  }

  statement {
    actions = [
        "iam:*"
    ]
    resources = [aws_iam_user.user.arn]
  }
}
