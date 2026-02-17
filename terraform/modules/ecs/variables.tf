variable "environment" {}
variable "vpc_id" {}
variable "public_subnets" { 
  type = list(string) 
}
variable "private_subnets" { 
  type = list(string) 
}
variable "app_name" {}
variable "container_image" {}
variable "container_port" {}
