provider "aws" {
  region = var.aws_region
}

# cluster EKS
resource "aws_eks_cluster" "fiap_cluster" {
  name = var.kubernetes_cluster_name
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

# Node group
resource "aws_eks_node_group" "fiap_node_group" {
  cluster_name = aws_eks_cluster.fiap_cluster.name
  node_group_name = var.node_group_name
  node_role_arn = var.node_role_arn
  subnet_ids = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types
}