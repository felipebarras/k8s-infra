data "aws_iam_role" "eks-service-role" {
  name = "eks-service-role"
}

data "aws_iam_role" "eks-node-role" {
  name = "eks-node-role"
}

data "aws_vpc" "vpc" {
  cidr_block = var.cidrBlocks
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

data "aws_subnet" "subnet" {
  for_each = toset(data.aws_subnets.subnets.ids)
  id       = each.value
}