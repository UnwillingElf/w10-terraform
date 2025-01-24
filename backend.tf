terraform {
  backend "s3" {
    bucket = "w6-terraform-bucket"
    key = "week10-terraform.tfstate"
    dynamodb_table = "statefile-lock"
    region = "us-east-1"
    encrypt = true
  }
}