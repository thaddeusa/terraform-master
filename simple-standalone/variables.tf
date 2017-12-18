variable "environment" {}
variable "aws_region" {}
variable "aws_key_name" {}
variable "amis_amzlinux" {
  type = "map"
  default = {
    us-east-1 = "ami-0b33d91d"
    us-west-2 = "ami-f173cc91"
  }
}
variable "instance_type" {
    default = "t2.micro"
}
variable "vpc1_cidr" {
    description = "CIDR for the VPC"
    default = "10.10.0.0/16"
}
variable "public_subnet_cidr_az1" {
    description = "CIDR for Public Subnet 1"
    default = "10.10.10.0/24"
}
