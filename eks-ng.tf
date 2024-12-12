# NodeGroup
resource "aws_eks_node_group" "fiap_node_group" {
  cluster_name    = aws_eks_cluster.fiap_cluster.name
  node_group_name = "NG-${var.appName}"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = [
    for subnet in data.aws_subnet.subnet : subnet.id
    if(
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
