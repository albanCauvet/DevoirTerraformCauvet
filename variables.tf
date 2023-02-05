################### PROVIDER ######################
variable "region" {
  description = "region of deployemnt"
  type        = string
}

variable "access_key" {
  description = "AWS_ACEES_KEY"
  type        = string
}

variable "secret_key" {
  description = "AWS_SECRET_SECRET_KEY"
  type        = string
}

########### VPC ##################
variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "vpc_name" {
  type = string
}

####### subnet ############
variable "subnet_conf" {
  type = map(any)
}

###### Security ###########
variable "sec_conf" {
  type = map(any)
}
/*
###### Instances ###########
variable "instance_conf" {
  type = map(any)
}
*/