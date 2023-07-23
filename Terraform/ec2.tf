resource "aws_instance" "bastion1" {
  ami                         =  "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet1.id
  #associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = "demo1"
  user_data = file("shell.bash")
    tags = {
    Name = "bastion1"
  }
}

resource "aws_instance" "bastion2" {
  ami                         =  "ami-053b0d53c279acc90"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet2.id
  #associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  key_name                    = "demo1"
  user_data = file("shell.bash")
    tags = {
    Name = "bastion2"
  }
}