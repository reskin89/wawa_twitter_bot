terraform {
  backend "s3" {
    bucket = "eskin-tf-remote-state"
    key    = "twitterbot-tf-state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf-remote-state" {
  bucket = "eskin-tf-remote-state"
  acl    = "private"

  versioning = {
    enabled = true
  }

  tags = {
    Name = "remote state for tf"
  }
}
