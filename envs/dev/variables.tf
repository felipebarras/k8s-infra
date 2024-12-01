variable "aws_region" {
    description = "AWS region"
    type = string
    default = "us-east-1"
}

variable "kubernetes_cluster_name" {
    description = "Name of the Kubernetes cluster"
    type = string
    default = "fiap-tech-challenge"
}

variable "db_name" {
    description = "Name of the database"
    type = string
}

variable "eks_role_arn" {
    description = "ARN of the IAM role for EKS nodes"
    type = string
    default = "arn:aws:iam::180294201352:role/eks-service-role"
}

variable "node_group_name" {
    description = "Name of the Node Group"
    type = string
    default = "fiap-tech-nodes"
}

variable "node_role_arn" {
    description = "ARN of the IAM role for EKS nodes"
    type = string
    default = "arn:aws:iam::180294201352:role/eks-node-role"
}

variable "subnet_ids" {
    description = "List of subnet IDs for the EKS cluster"
    type = list(string)
    default = ["subnet-008a55aa4bae0111c", "subnet-091eb123668306de5"]
}

variable "desired_size" {
    description = "Desired number of worker nodes in the Node group"
    type = number
    default = 2
}

variable "max_size" {
    description = "Maximum number of worker nodes in the Node group"
    type = number
    default = 3
}

variable "min_size" {
    description = "Minimum number of worker nodes in the Node group"
    type = number
    default = 1
}

variable "instance_types" {
    description = "Instance types associated with the EKS Node Group"
    type = list(string)
    default = ["t3.medium"]
}