terraform {
  backend "s3" {
    bucket = "roboshop1-terraform"
    key    = "roboshop/dev/terraform-tfstate"
    region = "us-east-1"
  }
}

