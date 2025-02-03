resource "aws_instance" "local-example" {
  ami = local.ami_id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type = "t3.micro"

  tags = {
    #expense-dev-backend
    Name = local.name
    Purpose = "terraform-practice"

  }
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "Allow TLS Inbound Traffic and all Outbound Traffic"

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

  tags = {
    Name = "allow_tls"
  }
}