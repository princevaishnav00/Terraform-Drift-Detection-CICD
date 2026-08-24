variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}



variable "aws_instance_type" {
  description = " EC2 instance type"
  type        = string
  default     = "t3.small"

}


variable "ami_id" {
  description = " EC2 instance AMI ID"
  type        = string
  default     = "ami-01a00762f46d584a1"
}


variable "bucket_name" {
  description = " S3 bucket name"
  type        = string
  default     = "drift-demo-bucket-2605"
}