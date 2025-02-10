variable "instances" {
  type = map
  default = {
    mysql = "t3.small"
    backend = "t3.micro"
    frontend = "t2.micro"
  }
}
variable "ingress_ports" {
    default = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "Allow SSH Access"
        },
        {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "Allow HTTP traffic"
        },
        {
            from_port = 3306
            to_port = 3306
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "Allow HTTPS Traffic"
        }
    ]
  
}

variable "domain_name" {
    default = "kumardevops.store"
  
}
variable "zone_id" {
    default = "Z021448929NMXW4P65UQE"
  
}