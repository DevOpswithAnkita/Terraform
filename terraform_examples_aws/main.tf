resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "WebServer-${count.index + 1}"
  }
}

resource "aws_s3_bucket" "buckets" {
  count  = var.bucket_count
  bucket = "${var.bucket_prefix}-${count.index + 1}"

  tags = {
    Name        = "${var.bucket_prefix}-${count.index + 1}"
    Environment = "Dev"
  }
}
