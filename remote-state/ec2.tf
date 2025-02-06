resource "aws_instance" "remote-state-example" {
  ami = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"
  tags = {
    Name = "terraform-demo"
    Purpose = "remote state"
  }
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "Allow TLS Inbound and all Outbound traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}