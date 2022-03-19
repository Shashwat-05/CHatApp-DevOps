variable "region" {
  type    = string
  default = "us-east-2"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "name" {
  type = string
  default = "chat-app"
}

variable "env" {
  type = string
  default = "project"
}

variable "public_subnets_cidr" {
  type = list(string)
  default=["10.0.1.0/24"]
}

variable "availability_zones" {
  type = list(string)
  default = ["us-east-2a","us-east-2b","us-east-2c"]
}

variable "private_subnets_cidr" {
  type = list(string)
  default = ["10.0.2.0/24"]
}