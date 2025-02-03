resource "aws_instance" "data-example" {
  ami                    = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t3.micro"

  tags = {
    Name    = "terraform-demo"
    Purpose = "terraform-practice"

  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound & outbound traffic requests"

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}