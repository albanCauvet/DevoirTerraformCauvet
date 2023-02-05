resource "aws_instance" "server" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_type           = var.instance_volume_type
    volume_size           = var.instance_volume_size
    delete_on_termination = false
    encrypted             = true
  }
  depends_on = [
    aws_iam_instance_profile.ec2_instance_profile
  ]
}

resource "aws_iam_role" "ec2_instance_role" {
  name = "${var.instance_name}-role"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]
  assume_role_policy = file("${path.module}/policies/policies.json")
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = var.instance_name
  role = aws_iam_role.ec2_instance_role.name
}

# resource "null_resource" "run-command" {

#   provisioner "remote-exec" {
#     inline = [
#       "ls"
#     ]
#   }

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     port        = 22
#     private_key = file("${path.cwd}/id_rsa")
#     host        = aws_instance.server.public_dns
#     agent       = false
#   }
#   depends_on = [
#     aws_instance.server
#   ]
# }

# resource "null_resource" "copy-files" {
#   count       = var.use_file ? 1 : 0
#   provisioner "file" {
#     source      = "./policies/policies.json"
#     destination = "~/policies.json"
#   }
#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("${path.cwd}/${var.key_name}")
#     host        = aws_instance.server.public_ip
#   }
# }

