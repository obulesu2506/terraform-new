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
