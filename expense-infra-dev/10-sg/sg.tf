module "mysql_sg" {
  #source = "../terraform-aws-sg" # is the source present in local system/folder
  source         = "git::https://github.com/obulesu2506/terraform-new.git//terraform-aws-sg?ref=main" #this one valid if the source present in github
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "mysql"
  sg_description = "Created for MYSQL instances in expense Dev Infra"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags


}

module "backend_sg" {
  source         = "git::https://github.com/obulesu2506/terraform-new.git//terraform-aws-sg?ref=main" #this one valid if the source present in github
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "backend"
  sg_description = "Created for backend instances in expense Dev Infra"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags

}

module "frontend_sg" {
  source         = "git::https://github.com/obulesu2506/terraform-new.git//terraform-aws-sg?ref=main" #this one valid if the source present in github
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "frontend"
  sg_description = "Created for frontend instances in expense Dev Infra"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags

}

module "bastion_sg" {
  source         = "git::https://github.com/obulesu2506/terraform-new.git//terraform-aws-sg?ref=main" #this one valid if the source present in github
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "bastion"
  sg_description = "Created for bastion instances in expense Dev Infra"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags
}

module "app_alb_sg" {
  source         = "git::https://github.com/obulesu2506/terraform-new.git//terraform-aws-sg?ref=main" #this one valid if the source present in github
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "app-alb"
  sg_description = "Created ALB for backend ALB in expense Dev Infra"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags

}

#ports 22(ssh), 443(http), 1194 (admin), 943 (admin web UI) --> VPN Ports 
module "vpn_sg" {
  source         = "git::https://github.com/obulesu2506/terraform-new.git//terraform-aws-sg?ref=main" #this one valid if the source present in github
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "vpn"
  sg_description = "Created VPN SG for VPN instances in expense Dev Infra"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags

}

# APP ALB accepting traffic from bastion
resource "aws_security_group_rule" "app_alb_bastion" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.app_alb_sg.sg_id
}

# JDOPS-32, Bastion host should be accessed from office n/w
resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion_sg.sg_id
}

resource "aws_security_group_rule" "vpn_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn_sg.sg_id

}

resource "aws_security_group_rule" "vpn_443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn_sg.sg_id

}

resource "aws_security_group_rule" "vpn_943" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn_sg.sg_id
}

resource "aws_security_group_rule" "vpn_1194" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn_sg.sg_id

}

resource "aws_security_group_rule" "app_alb_vpn" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id        = module.app_alb_sg.sg_id

}
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id        = module.mysql_sg.sg_id
}

resource "aws_security_group_rule" "mysql_vpn" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id        = module.mysql_sg.sg_id
}
#Security group between VPN to backend for connecting and then run Ansible related sconfiguration
resource "aws_security_group_rule" "backend_vpn" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = module.vpn_sg.sg_id
  security_group_id        = module.backend_sg.sg_id
}
#Security group between backend and MYSQL for connecting and then run Ansible related sconfiguration
resource "aws_security_group_rule" "mysql_backend" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.backend_sg.sg_id
  security_group_id        = module.mysql_sg.sg_id
}