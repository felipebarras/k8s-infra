terraform {
  backend "s3" {
    bucket = "postech-backend-tf"
    key    = "s3/post-8soat/terraform.tfstate"
    region = "us-east-1"
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
  }
}