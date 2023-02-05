resource "aws_security_group" "front" {
  for_each    = var.sec_conf
  name        = each.value.name
  description = each.value.description
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = each.value.rules
    content {
      description = "HTTPS from VPC"
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}