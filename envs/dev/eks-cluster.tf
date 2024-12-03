# cluster EKS
resource "aws_eks_cluster" "fiap_cluster" {
  name     = "EKS-${var.appName}"
  role_arn = data.aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids      = []
    security_groups = []
  }

  access_config {
    authentication_mode = var.authMode
  }
}
