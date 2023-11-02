output "sn1" {
  value = aws_subnet.sn1.id
}
output "work-sg" {
  value = aws_security_group.work-sg.id
}
output "vpc-id" {
  value = aws_vpc.felix-vpc.id
}
