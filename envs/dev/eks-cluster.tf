# cluster EKS
resource "aws_eks_cluster" "fiap_cluster" {
  name     = "EKS-${var.appName}"
  role_arn = data.aws_iam_role.eks-service-role.arn

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnet.subnet : subnet.id]
    security_group_ids = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.authMode
  }
}
