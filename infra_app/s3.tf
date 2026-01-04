resource "aws_s3_bucket" "terraform-s3-bucket" {
  bucket = "${var.env}-terraform-s3-bucket"

  tags = {
    Name        = "${var.env}-terraform-s3-bucket"
    Environment = "${var.env}-env"
  }
}