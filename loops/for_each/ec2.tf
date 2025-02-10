resource "aws_instance" "for_each-example" {
    for_each = var.instances
    
    ami = "aws-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    instance_type = each.value

    tags = {
        Name = each.key
        Purpose = "terraform-practice"
    }
  
}
resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "Allow TLS Inbound and all Outbound rules"
    /*
   dynamic "ingress" {
     for_each = var.ingress
     content {

        
     }
   }
    */
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

output "ec2_info" {
    value = aws_instance.for_each-example
  
}