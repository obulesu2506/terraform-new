variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Name      = "expense"
    Purpose   = "creating for expense Infra ALB module"
    Terraform = "true"
  }
}
variable "zone_id" {
  default = "Z03128223E3YMCTAWVCQ9"
}

variable "domain_name" {
  default = "kumardevops.store"
}