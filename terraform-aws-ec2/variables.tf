variable "ami_id" {
    default = "ami-09c813fb71547fc4f"
  
}

#mandatory
variable "sg_id" {

  
}

variable "instance_type" {
  default = "t3.micro"
  validation {
    condition = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Valid values for instance type are : t3.small, t3.micro,t3.medium"
  }
}
#optional
variable "tags" {
    default = {} #if we not specified this line then terraform treat as mandatory input variable and should be passed during runtime, then in that case tags are not optional
  
}