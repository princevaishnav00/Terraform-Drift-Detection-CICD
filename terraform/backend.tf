terraform {
  backend "s3" {
    bucket = "terraform-bucket-drift-1432"
    key    = "drift-demo/terraform.tfstate"
    region = "ap-south-1"
  }
}