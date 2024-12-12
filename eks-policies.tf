# Policy para o eks_user
resource "aws_iam_policy" "eks_user_policy" {
  name        = "eks_user_policy"
  description = "Policy for EKS User to manage roles and resources"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "sts:AssumeRole",
          "iam:GetRole",
          "iam:ListRoles",
          "iam:ListRolePolicies",
          "iam:ListAttachedRolePolicies",
          "iam:ListEntitiesForPolicy",
          "iam:AttachRolePolicy",
          "iam:PutRolePolicy",
          "iam:PassRole",
          "iam:DetachRolePolicy",
          "iam:CreateRole",
          "iam:DeleteRole",
          "iam:CreatePolicy",
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupEgress"
        ],
        Resource = [
          "arn:aws:iam::180294201352:role/*",
          "arn:aws:ec2:us-east-1:180294201352:security-group/*"
        ]
      }
    ]
  })
}