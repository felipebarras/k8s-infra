variable "aws_region" {
    description = "AWS region"
    type = string
    default = "us-east-1"
}

variable "kubernetes_cluster_name" {
    description = "Name of the Kubernetes cluster"
    type = string
}

variable "db_name" {
    description = "Name of the database"
    type = string
}

variable "environment" {    
    description = "Environment(dev, staging, prod)"
    type = string
}

variable "eks_role_arn" {
    description = "ARN of the IAM role for EKS nodes"
    type = string
}

variable "subnet_ids" {
    description = "List of subnet IDs for the EKS cluster"
    type = list(string)
}

variable "desired_size" {
    description = "Desired number of worker nodes in the Node group"
    type = number
    default = 1
}

variable "instance_types" {
    description = "Instance types associated with the EKS Node Group"
    type = list(string)
    default = ["t3.medium"]
}