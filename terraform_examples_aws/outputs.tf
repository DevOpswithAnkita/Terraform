output "instance_ids" {
  value = aws_instance.web[*].id
}

output "public_ips" {
  value = aws_instance.web[*].public_ip
}

output "bucket_names" {
  value = aws_s3_bucket.buckets[*].bucket
}
