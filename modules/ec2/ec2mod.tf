resource "aws_instance" "work" {
  count                       = 1 
  ami                         = var.ubuntu
  instance_type               = "t2.micro"
  subnet_id                   = var.sn1
  key_name                    = var.key-pair
  vpc_security_group_ids      = [var.work-sg]
  associate_public_ip_address = true
  user_data                   = filebase64("modules/ec2/sh/workstation.sh")
  tags = {
    Name = "${var.project}-work${count.index}"
  }
}
