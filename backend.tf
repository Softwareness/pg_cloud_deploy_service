terraform {
  backend "s3" {
    bucket         = "terraform-state-backend-ferry"
    key            = "terraform.tfstate" // We cannot use variables because TF is not initated at this moment. We can use HCLEDIT for this value
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

