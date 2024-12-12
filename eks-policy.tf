data "aws_iam_role" "eks_service_role" {
  name = aws_iam_role.eks_service_role.name
}

resource "aws_iam_policy" "eks_policy" {
  name        = "eks_policy"
  description = "Policy for EKS cluster access"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = [
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:AccessKubernetesApi"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_eks_access_policy_association" "eks-policy" {
  cluster_name  = aws_eks_cluster.fiap_cluster.name
  policy_arn    = aws_iam_policy.eks_policy.arn
  principal_arn = data.aws_iam_role.eks_service_role.arn

  access_scope {
    type = "cluster"
  }
}
