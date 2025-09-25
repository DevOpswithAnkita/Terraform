variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 10
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the instances"
  type        = string
  default     = "ami-12345678"
}

variable "bucket_count" {
  description = "Number of S3 buckets"
  type        = number
  default     = 10
}

variable "bucket_prefix" {
  description = "Prefix for bucket names"
  type        = string
  default     = "company-ankita"
}
