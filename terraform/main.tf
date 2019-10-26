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

resource "aws_s3_bucket" "go_bins" {
  bucket = "eskin-pipeline-data"
  acl    = "private"

  versioning = {
    enabled = true
  }

  tags = {
    Name = "GoLang Binary Storage"
  }
}
