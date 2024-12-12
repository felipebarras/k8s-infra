resource "aws_iam_role" "eks_service_role" {
  name = "eks-service-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "arn:aws:iam::180294201352:user/eks_user"
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
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "arn:aws:iam::180294201352:user/eks_user"
        }
      }
    ]
  })
}

# adicionando políticas às Roles
resource "aws_iam_role_policy_attachment" "eks_service_role_policy_attachment" {
  role = aws_iam_role.eks_service_role.name
  policy_arn = aws_iam_policy
}