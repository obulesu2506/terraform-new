variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "instance type version"
}

variable "project" {
  default = "expense"

}

variable "component" {
  default = "backend"

}

variable "environment" {
  default = "dev"
}