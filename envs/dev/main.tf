provider "aws" {
  region = "us-east-1"
}

# cluster EKS
resource "aws_eks_cluster" "fiap_cluster" {
  name = "fiap-tech-challenge"
  role_arn = "arn:aws:iam::180294201352:role/eks-service-role"

  vpc_config {
    subnet_ids = ["subnet-008a55aa4bae0111c", "subnet-091eb123668306de5"]
  }
}

# Node group
resource "aws_eks_node_group" "fiap_node_group" {
  cluster_name = "node_group_fiap_cluster_name"
  node_group_name = "fiap-tech-nodes"
  node_role_arn = "arn:aws:iam::180294201352:role/eks-node-role"
  subnet_ids = ["subnet-008a55aa4bae0111c", "subnet-091eb123668306de5"]

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.medium"]
}