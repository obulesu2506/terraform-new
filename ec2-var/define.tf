variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This AMI ID is related for the devops-practice image"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "ec2_tags" {
  type = map(string)
  default = {
    project     = "expense"
    component   = "backend"
    environment = "dev"
    Name        = "expense-backend-dev"
  }

}

variable "from_port" {
  type    = number
  default = 22

}

variable "to_port" {
  type    = number
  default = 22

}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    type    = map(string)
    default = {
             Name = "expense-backedn-dev"
  }
}