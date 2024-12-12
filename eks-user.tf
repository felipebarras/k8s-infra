# Criando o usuário
resource "aws_iam_user" "eks_user" {
  name = "eks_user"
}

# adicionando políticas ao usuário
resource "aws_iam_user_policy_attachment" "eks_user_policy_attachment" {
    user = aws_iam_user.eks_user.name
    policy_arn = aws_iam_user_policy.eks_user_policy.arn
}

# access key para o User
resource "aws_iam_access_key" "eks_user_access_key" {
  user = aws_iam_user.eks_user.name
}

# access key para o Github Secrets
output "eks_user_access_key_id {
    value = aws_iam_access_key.eks_user_access_key.id
    sensitive = true
}

output "eks_user_secret_access_key" {
    value = aws_iam_access_key.eks_user_access_key.secret
    sensitive = true
}