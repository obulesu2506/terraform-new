resource "aws_route53_record" "expense" {
    
    for_each = aws_instance.for_each-example
    zone_id = var.zone_id
    #name = "${var.instances[count.index]}.${var.domain_name}" #interpolation
    name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    #records = [aws_instance.for_each-example[count.index].private_ip] #list type
    records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip] 
    allow_overwrite = true

  
}