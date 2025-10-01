output "website_url" {
  value = aws_s3_bucket_website_configuration.my_portfolio.website_endpoint # use the Terraform resource name
}