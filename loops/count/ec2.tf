resource "aws_instance" "expense" {
  count                  = length(var.instances)
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = var.instance_type
  tags = merge(
    var.common_tags,
    {
      Name = var.instances[count.index]
    }
  )
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS all inbound & all outbound traffic"

  ingress = {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  tags = var.common_tags
}