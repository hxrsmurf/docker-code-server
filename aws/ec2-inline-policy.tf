data "aws_iam_policy_document" "ec2_inline_policy" {
  policy_id = "EC2-TF"
  statement {
    actions = [
      "ec2:UnmonitorInstances",
      "ec2:TerminateInstances",
      "ec2:StopInstances",
      "ec2:StartInstances",
      "ec2:RunInstances",
      "ec2:MonitorInstances",
      "ec2:ModifyInstanceCreditSpecification",
      "ec2:ModifyInstanceAttribute",
      "ec2:ModifyDefaultCreditSpecification",
      "ec2:GetDefaultCreditSpecification",
      "ec2:DescribeVolumes",
      "ec2:DescribeTags",
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceCreditSpecifications",
      "ec2:DescribeInstanceAttribute",
      "ec2:DescribeImages",
      "ec2:DescribeIamInstanceProfileAssociations",
      "ec2:DeleteTags",
      "ec2:CreateTags"
    ]
    resources = ["*"]
  }
}
