provider "aws" {

  access_key = 

  secret_key =

  region     = "us-east-1"
}

# Create a bucket
resource "aws_s3_bucket" "lakshmib1" {

  bucket = "s3-terraform-bucket-lakshmi-lab"

  acl    = "private"   # or can be "public-read"

  tags = {

    Name        = "My bucket"

    Environment = "Dev"

  }

}

# Upload an object
resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.lakshmib1.id

  key    = "profile"

  acl    = "private"  # or can be "public-read"

  source = "sample.txt"

  etag = filemd5("sample.txt")

}
