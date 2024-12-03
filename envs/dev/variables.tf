variable "awsRegion" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "appName" {
  default = "fiap-tech-challenge"
}

variable "authMode" {
  default = "API_AND_CONFIG_MAP"
}

variable "node_group_name" {
  default = "fiap-tech-nodes"
}

variable "policyArn" {
  default = ""
}

variable "instanceType" {
  default = "t3.medium"
}

variable "principalArn" {
  default = "arn:aws:iam::180294201352:role/eks-service-role"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
  default     = ["subnet-008a55aa4bae0111c", "subnet-091eb123668306de5"]
}

