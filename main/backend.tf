terraform {
  backend "s3" {
    bucket         = "aca-lesson-3"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "projects/aca-lesson-3.tfstate"
    region         = "us-east-1"
  }
}
