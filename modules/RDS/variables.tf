variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "ec2_sg_id" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}
