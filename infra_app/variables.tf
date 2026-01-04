variable "env" {
  description = "this is the env for my infra"
  type = string
}

variable "ec2_count" {
  description = "this is the count of ec2 instance"
  type = number
}

variable "ami" {
  description = "this is the ami id for ec2 instance"
  type = string
}

variable "instance_type" {
  description = "this is the insatnce type of ec2"
  type = string
}

variable "root_block_device" {
  description = "this is the type of volume for ec2 isntance"
  type = string
}

variable "root_block_size" {
  description = "this is the size of volume for ec2 instance"
  type = number
}

variable "hash_key" {
  description = "this is the hash_key for dynamodb"
  type = string
}