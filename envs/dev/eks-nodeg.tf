# Node group
resource "aws_eks_node_group" "fiap_node_group" {
  cluster_name    = aws_eks_cluster.fiap_cluster.name
  node_group_name = "NG-${var.appName}"
  node_role_arn   = data.aws_iam_role.eks-node-role.arn
  
  subnet_ids      = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.awsRegion}e"]
  instance_types  = [var.instanceType]
  disk_size       = 50

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }
}