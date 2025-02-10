resource "aws_instance" "for_each-example" {
  for_each = var.instances

  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = each.value

  tags = {
    Name    = each.key
    Purpose = "terraform-practice"
  }

}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS Inbound and all Outbound rules"

  dynamic "ingress" {
    for_each = [for port in var.ingress_ports : port if port.from_port == 3306] #This logic for fetching single iteration out of 4 values
    #for_each = var.ingress_ports # this logic for fetching all 4 defined variables
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
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

output "ec2_info" {
  value = aws_instance.for_each-example

}