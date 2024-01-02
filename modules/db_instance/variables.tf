variable "allocated_storage" {
  description = "allocated_storage"
  type = number
  default = 20
}

variable "storage_type" {
  description = "storage_type"
  type = string
  default = "gp2"
}

variable "engine" {
  description = "engine"
  type = string
  default = "postgres"
}

variable "engine_version" {
  description = "engine_version"
  type = string
  default = "15"
}

variable "instance_class" {
  description = "instance_class"
  type = string
  default = "db.t3.micro"
}

variable "username" {
  description = "username"
  type = string
  default = "ferry"
}

variable "password" {
  description = "password"
  type = string
  default = "kjsdgkjfdskj^^%$$"
}

variable "parameter_group_name" {
  description = "DB parameter group"
  type = string
}

variable "vpc_security_group_ids" {
  description = "VPC security group to allow connections to the database"
  type = string
}

variable "db_subnet_group_name" {
  description = "Subnet in which the instance will be deployed"
  type = string
}

variable "identifier" {
  description = "Identifier for DB Instance"
}

variable "tags" {
  description = "Tags for resources"
  type = map(string)
  default = {}
}

variable "aws_region" {
  type = string
  default = "eu-west-1"
}