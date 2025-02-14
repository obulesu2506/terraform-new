variable "project_name" {
  
}
variable "environment" {
  
}
variable "vpc_cidr" {
  
}

variable "enable_dns_hostnames" {
    default = true
  
}
variable "common_tags" {
    type = map
    #default = {}
}

variable "vpc_tags" {
    default = {}
}
variable "igw_tags" {
    default = {}
}
variable "public_subnet_cidrs" {
  type = list
  validation {
    condition = length(var.public_subnet_cidrs) == 2
    error_message = "Kindly provide 2 valid Public subnet CIDR"
  }
}
variable "public_subnet_tags" {
    default = {}
  
}

variable "private_subnet_cidrs" {
  type = list
  validation {
    condition = length(var.private_subnet_cidrs) == 2
    error_message = "kindly provide atleast 2 valid Private subnet CIDR"
  }
}
variable "private_subnet_tags" {
  default = {}
}

variable "database_subnet_cidrs" {
  type = list
  validation {
    condition = length(var.database_subnet_cidrs) == 2
    error_message = "Kindlt provide atleast 2 valid database subnet CIDR"
  }
}

variable "database_subnet_tags" {
  default = {}
}

variable "nat_gateway_tags" {
  default = {}
}

variable "public_route_table_tags" {
  default = {}
}

variable "private_route_table_tags" {
  default = {}
}

variable "database_route_table_tags" {
  default = {}

}

variable "is_peering_required" {
  default = false
}
variable "vpc_peering-tags" {
  default = {}
}
variable "vpc_peering_tags" {
    default = {}
}