# Main Terraform configuration file


# VPC

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    Name = "drift-demo-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "drift-demo-subnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "drift-demo-igw"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    gateway_id = aws_internet_gateway.main.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "drift-demo-rt"
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}


# ------------- Security group ----------------------
 
resource "aws_security_group" "main" {
  name        = "drift-demo-sg"
  description = "Security group for drift demo"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    

  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drift-demo-sg"
  }
}



# ----------------- EC2-instance ------------------------- 

resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.aws_instance_type
  subnet_id     = aws_subnet.main.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.main.id
  ]

  tags = {
    Name = "drift-demo-instance"
  }
}


# --------------- Bucket -------------------

resource "aws_s3_bucket" "drift-demo-bucket" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

