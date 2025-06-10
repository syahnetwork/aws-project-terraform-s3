provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "darma-myunique-bucket-name-987654" # Must be globally unique

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "my_bucket_controls" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_block" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
} 