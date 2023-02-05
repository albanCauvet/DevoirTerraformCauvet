variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "instance_volume_type" {
  type = string
}

variable "instance_volume_size" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "use_file" {
  type = bool
}