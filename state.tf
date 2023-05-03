terraform {
  backend "s3" {
    bucket = "Roboshop1-terraform"
    key    = "roboshop/dev/terraform-tfstate"
    region = "us-east-1"
  }
}
