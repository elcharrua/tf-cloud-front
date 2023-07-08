resource "aws_s3_bucket" "bucket_s3" {
  bucket = var.bucket_name

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = [""]
    max_age_seconds = 3000
  }

  tags = var.tags
}
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket_s3.id
  acl    = var.bucket_acl
}
resource "aws_s3_bucket_public_access_block" "bucket_block_s3" {
  bucket                  = aws_s3_bucket.bucket_s3.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}
resource "aws_s3_bucket_versioning" "b_versioning" {
  bucket = aws_s3_bucket.bucket_s3.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}
