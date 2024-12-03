# cluster EKS
resource "aws_eks_cluster" "fiap_cluster" {
  name     = "EKS-${var.appName}"
  role_arn = data.aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids      = [for subnet in data.aws_subnet.subnet : subnet_id if subnet.availability_zone != "${var.awsRegion}e"]
    security_groups = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.authMode
  }
}
