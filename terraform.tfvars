################### PROVIDER ######################
region     = "eu-west-1"
access_key = ""
secret_key = ""

########### VPC ##################
vpc_cidr_block       = "10.0.0.0/16"
enable_dns_support   = true
enable_dns_hostnames = true
vpc_name             = "test_vpc"

####### subnet ############
subnet_conf = {
  "front" = {
    subnet_name       = "front-subnet"
    subnet_cidr_block = "10.0.0.0/24"
    public_subnet     = true
  },
  "middle" = {
    subnet_name       = "middle-subnet"
    subnet_cidr_block = "10.0.1.0/24"
    public_subnet     = true
  },
  "back" = {
    subnet_name       = "back-subnet"
    subnet_cidr_block = "10.0.2.0/24"
    public_subnet     = true
  }
}

#######  Security #####################
sec_conf = {
  "front" = {
    name        = "front"
    description = "rules for front"
    rules = [
      {
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
      },
      {
        from_port = 443
        to_port   = 443
        protocol  = "tcp"
      },
      {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
      },

    ]
  },
  "back" = {
    name        = "back"
    description = "rules for back"
    rules = [
      {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
      }
    ]
  },
}
/*
########### Instance ############
instance_conf = {
  "front" = {
    instance_name = "front"
    instance_type = "t2.micro"
    ami_id        = "ami-0c2b8ca1dad447f8a"
    key_name      = "test"
    subnet_id     = "subnet-0b1e1c4b1b9b1c1d1"
    security_groups = [
      "sg-0b1e1c4b1b9b1c1d1"
    ]
  },
  "back" = {
    instance_name = "back"
    instance_type = "t2.micro"
    ami_id        = "ami-0c2b8ca1dad447f8a"
    key_name      = "test"
    subnet_id     = "subnet-0b1e1c4b1b9b1c1d1"
    security_groups = [
      "sg-0b1e1c4b1b9b1c1d1"
    ]
  }
}
*/