terraform {
  backend "s3" {
    bucket         = "cu-project-terraform-backend-s3"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

