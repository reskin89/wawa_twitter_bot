provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "remote-state" {
  bucket = "eskin-tf-remote-state"
  acl    = "private"

  versioning = {
    enabled = true
  }

  tags = {
    Name = "tf-remote-state"
  }
}
