variable "project" {
    type = string
    default = "expense"
  
}

variable "environment" {
  
}

variable "instances" {
  type = list
  default = ["mysql","backend","frontend"]
}

variable "zone_id" {
    type = string
    default = "Z03128223E3YMCTAWVCQ9"
  
}

variable "domain_name" {
    type = string
    default = "kumardevops.store"
  
}
variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Terraform = "true"
    }
  
}