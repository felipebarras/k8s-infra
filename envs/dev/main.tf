provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "fiap_cluster" {
  name = "fiap-tech-challenge"
  role_arn = "arn:aws:iam:123456789012:role/eks-role"

  vpc_config {
    subnet_ids = ["subnet-12345", "subnet-67890"]
  }
}