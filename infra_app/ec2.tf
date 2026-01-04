#KEY PAIR

resource "aws_key_pair" "aws_key" {
  key_name   = "${var.env}_aws_key"
  public_key = file("${path.module}/../keys/aws_key.pub")
}

#VPC

resource "aws_default_vpc" "default" {}

#SECURITY GROUP

resource "aws_security_group" "mySG" {
  name = "${var.env}_mySG"
  description = "SG to default VPC"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "allow ssh"
  }

  ingress {
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "allow http"
  }

  ingress {
    from_port = 8000
    to_port = 8000
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    description = "application port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-mySG"
    Environment = "${var.env}-env"
  }
}

# EC2 INSTANCE

resource "aws_instance" "instance" {
    count = var.count
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.aws_key.key_name
    vpc_security_group_ids = [aws_security_group.mySG.id]
    user_data = file("install_nginx.sh")

    root_block_device {
      volume_size = var.root_block_size
      volume_type = var.root_block_device
    }

    tags = {
        Name = "${var.env}-instance"
        Environment = "${var.env}-env"
    }
}
