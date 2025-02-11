output "public_ip" {
  value = aws_instance.module-example.public_ip
}

output "private_ip" {
  value = aws_instance.module-example.private_ip

}