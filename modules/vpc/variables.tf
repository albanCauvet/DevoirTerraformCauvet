################## NETWORK CONFIG ###################
variable "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
}

variable "vpc_name" {
  description = "The name to give to the VPC"
  type        = string
}