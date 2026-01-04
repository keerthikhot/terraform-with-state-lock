resource "aws_s3_bucket" "terraform-s3-bucket-2402" {
  bucket = "${var.env}-terraform-s3-bucket-2402"

  tags = {
    Name        = "${var.env}-terraform-s3-bucket-2402"
    Environment = "${var.env}-env"
  }
}

