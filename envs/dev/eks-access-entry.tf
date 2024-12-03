resource "aws_eks_access_entry" "access-entry" {
  cluster_name      = aws_eks_cluster.fiap_cluster.name
  principal_arn     = data.aws_iam_role.eks-service-role.arn
  kubernetes_groups = ["fiap"]
  type              = "STANDARD"
}
