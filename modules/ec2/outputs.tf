output "work" {
  value = aws_instance.work[*].id
}
/*output "bkend" {
  value = aws_instance.backend.private_ip
}*/
