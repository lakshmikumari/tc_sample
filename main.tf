provider "aws" {

  access_key = "AKIARKCBBL5W7ZS7ITFR"

  secret_key = "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"

  region     = "us-east-1"
}

# Create a bucket
resource "aws_s3_bucket" "lakshmib11" {

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
