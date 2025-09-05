variable "aws-ec2-instance-type" {
  default = t2.micro
  type = string
}
variable "aws-ec2-ebs-stoarge" {
    default = 15
    type = number
}
variable "aws-ec2-ami-id" {
    default = "ami-0360c520857e3138f"  
    type =  string
}