# cluster EKS
resource "aws_eks_cluster" "fiap_cluster" {
  name     = "EKS-${var.appName}"
  role_arn = aws_iam_role.eks_service_role.arn

  vpc_config {
    subnet_ids = [
      for subnet in data.aws_subnet.subnet : subnet.id
      if(
        data.aws_subnet.subnet[subnet.id].availability_zone == "us-east-1a" ||
        data.aws_subnet.subnet[subnet.id].availability_zone == "us-east-1b" ||
        data.aws_subnet.subnet[subnet.id].availability_zone == "us-east-1c" ||
        data.aws_subnet.subnet[subnet.id].availability_zone == "us-east-1d"
      )
    ]
    security_group_ids = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.authMode
  }
}