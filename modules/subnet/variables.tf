variable "subnet_name" {
  description = "The subnet name"
  type        = string
}

variable "availability_zones" {
  description = "availability zones"
  type        = number
  default     = 1
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}


variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}


variable "public_subnet" {
  description = "If the value is set to true, the subnet will have public access"
  type        = bool
}