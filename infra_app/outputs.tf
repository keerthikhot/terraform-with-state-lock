output "public_dns" {
  value = aws_instance.instance[*].public_dns
}

output "public_ips" {
  value = aws_instance.instance[*].public_ip
  description = "Public IP addresses of the EC2 instances"
}
