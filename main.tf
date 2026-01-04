module "dev_infra_with_state_lock" {
  source  = "./infra_app"

  # DEV ENVIRONMENT
  env = "dev"
  count = 1
  ami = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"
  root_block_device = "gp3"
  root_block_size = 8
}

module "prd_infra_with_state_lock" {
  source  = "./infra_app"

  # DEV ENVIRONMENT
  env = "prd"
  count = 2
  ami = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"
  root_block_device = "gp3"
  root_block_size = 8
}

output "dev_public_ips" {
  value = module.dev_infra_with_state_lock.ec2_instances_public_ips
  description = "Public IPs of the dev environment EC2 instances"
}

output "prd_public_ips" {
  value = module.prd_infra_with_state_lock.ec2_instances_public_ips
  description = "Public IPs of the stg environment EC2 instances"
}
