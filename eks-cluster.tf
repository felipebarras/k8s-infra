resource "aws_iam_role" "eks_service_role" {
  name = "eks-service-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role" "eks_node_role" {
  name = "eks-node-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# cluster EKS
resource "aws_eks_cluster" "fiap_cluster" {
  name     = "EKS-${var.appName}"
  role_arn = aws_iam_role.eks_service_role.arn

  vpc_config {
    subnet_ids = [
      for subnet in data.aws_subnet.subnet : subnet.id
      if (
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

resource "aws_eks_node_group" "fiap_node_group" {
  cluster_name    = aws_eks_cluster.fiap_cluster.name
  node_group_name = "NG-${var.appName}"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = [
      for subnet in data.aws_subnet.subnet : subnet.id
      if (
        data.aws_subnet.subnet[subnet.id].availability_zone == "us-east-1a" ||
        data.aws_subnet.subnet[subnet.id].availability_zone == "us-east-1b" ||
        data.aws_subnet.subnet[subnet.id].availability_zone == "us-east-1c" ||
        data.aws_subnet.subnet[subnet.id].availability_zone == "us-east-1d"
      )
    ]
  instance_types = [var.instanceType]
  disk_size      = 50

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }
}
