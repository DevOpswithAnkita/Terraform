resource "aws_s3_bucket" "my_portfolio" {
  bucket = "devopswithankita"   # AWS bucket name

  tags = {                       # Bucket tags
    Name        = "devopswithankita"  # Tag Name
    Environment = "Prod"              # Tag Environment
  }
}

resource "aws_s3_bucket_public_access_block" "my_portfolio_block" {
  bucket = aws_s3_bucket.my_portfolio.id  # Reference bucket resource
  block_public_acls       = false         # Do not block public ACLs
  block_public_policy     = false         # Do not block public bucket policies
  ignore_public_acls      = false         # Respect any ACLs
  restrict_public_buckets = false         # Do not restrict public bucket access
}

resource "aws_s3_bucket_policy" "my_portfolio_policy" {
  bucket = aws_s3_bucket.my_portfolio.id  # Attach policy to this bucket
  policy = jsonencode({                    # JSON-encoded bucket policy
    Version = "2012-10-17",               # Policy version
    Statement = [
      {
        Sid       = "PublicReadGetObject"         # Statement ID
        Effect    = "Allow"                       # Allow action
        Principal = "*"                            # Everyone (public)
        Action    = "s3:GetObject"                # Allow read objects
        Resource  = "arn:aws:s3:::devopswithankita/*"  # All objects in bucket
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "my_portfolio" {
  bucket = aws_s3_bucket.my_portfolio.id  # Reference the bucket
  index_document {
    suffix = "test.html"       # Main website page
  }
}

resource "aws_s3_object" "my_portfolio" {
  bucket       = aws_s3_bucket.my_portfolio.id  # Target S3 bucket
  source       = "test.html"        # Local file path
  key          = "test.html"        # Name in S3
  content_type = "text/html"                    # Tell browser it’s HTML
}
