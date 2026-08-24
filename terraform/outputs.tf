# Terraform outputs configuration

# Add your output definitions here


output "instance_id" {
  value = aws_instance.main.id
}


output "instance_public_ip" {
  value = aws_instance.main.public_ip
}


output "instance_public_dns" {
  value = aws_instance.main.public_dns
}


output "instance_private_ip" {
  value = aws_instance.main.private_ip
}



output "bucket_name" {
  value = aws_s3_bucket.drift-demo-bucket.bucket
}


output "bucket_arn" {
  value = aws_s3_bucket.drift-demo-bucket.arn
}


output "bucket_id" {
  value = aws_s3_bucket.drift-demo-bucket.id
}
