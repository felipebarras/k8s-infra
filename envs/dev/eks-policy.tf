resource "aws_eks_access_policy_association" "eks-policy" {
  cluster_name  = aws_eks_cluster.fiap_cluster.name
  policy_arn    = var.policyArn
  principal_arn = data.aws_iam_role.eks-service-role.arn

  access_scope {
    type = "cluster"
  }
}