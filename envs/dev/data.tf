data "aws_iam_role" "eks-service-role" {
  name = "eks-service-role"
}

data "aws_iam_role" "eks-node-role" {
  name = "eks-node-role"
}