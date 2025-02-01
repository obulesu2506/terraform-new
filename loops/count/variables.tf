variable "instances" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]

}

variable "instance_type" {
  type    = string
  default = "t3.micro"

}

variable "zone_id" {
  type    = string
  default = "Z03128223E3YMCTAWVCQ9"

}

variable "domain_name" {
  type    = string
  default = "kumardevops.store"
}

variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This AMI ID is related to devops-practice"
}

variable "from_port" {
  default = 22

}

variable "to_port" {
  default = 22

}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]

}

variable "common_tags" {
  type = map(string)
  default = {
    enviornment = "dev"
    project     = "expense"
  }
}