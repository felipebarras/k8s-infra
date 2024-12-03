terraform {
  backend "s3" {
    bucket = "postech-backend-tf"
    key    = "eks-post-8soat/terraform.tfstate"
    region = "us-east-1"
  }
}