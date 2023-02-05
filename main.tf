######### CALL VPC MODULE ###########
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_name             = var.vpc_name
}

########## CALL SUBNET MODULE ###############
module "subnet" {
  for_each          = var.subnet_conf
  source            = "./modules/subnet"
  subnet_name       = each.value.subnet_name
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = each.value.subnet_cidr_block
  public_subnet     = each.value.public_subnet
}

module "front" {
  count                = 2
  source               = "./modules/instances"
  instance_ami         = ["ami-0333305f9719618c7", "ami-0333305f9719618c7"][count.index]
  instance_type        = "t2.micro"
  subnet_id            = module.subnet["front"].subnet_id[0]
  instance_name        = "front${count.index}"
  instance_volume_type = "gp3"
  instance_volume_size = "50"
  vpc_id               = module.vpc.vpc_id
  sg_id                = aws_security_group.front["front"].id
  key_name             = aws_key_pair.tf-key-pair.key_name
  use_file             = false
}

module "middle" {
  count                = 2
  source               = "./modules/instances"
  instance_ami         = ["ami-0333305f9719618c7", "ami-0333305f9719618c7"][count.index]
  instance_type        = "t2.micro"
  subnet_id            = module.subnet["middle"].subnet_id[0]
  instance_name        = "middle${count.index}"
  instance_volume_type = "gp3"
  instance_volume_size = "50"
  vpc_id               = module.vpc.vpc_id
  sg_id                = aws_security_group.front["back"].id
  key_name             = aws_key_pair.tf-key-pair.key_name
  use_file             = false
}

module "back" {
  count                = 2
  source               = "./modules/instances"
  instance_ami         = ["ami-0333305f9719618c7", "ami-0333305f9719618c7"][count.index]
  instance_type        = "t2.micro"
  subnet_id            = module.subnet["back"].subnet_id[0]
  instance_name        = "back${count.index}"
  instance_volume_type = "gp3"
  instance_volume_size = "50"
  vpc_id               = module.vpc.vpc_id
  sg_id                = aws_security_group.front["back"].id
  key_name             = aws_key_pair.tf-key-pair.key_name
  use_file             = false
}

output "subnet" {
  value = module.subnet["back"].subnet_id
}


