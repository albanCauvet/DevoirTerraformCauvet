output "subnet_id" {
  description = "subnet id"
  value       = aws_subnet.subnet.*.id
}