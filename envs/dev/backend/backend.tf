terraform {
  backend "s3" {
    bucket = "postech-backend-tf"
    key    = "s3/post-8soat/terraform.tfstate"
    region = "us-east-1"
    access_key = "AKIAST6S7GAEHFYY4EPI"
    secret_key = "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"
  }
}