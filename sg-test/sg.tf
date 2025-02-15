module "mysql_sg" {
  source = "../terraform-aws-sg" # is the source present in local system/folder
  #source = "git::https://github.com/obulesu2506/terraform-new.git//terraform-aws-vpc" this one valid if the source present in github
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = "mysql"
  sg_description = "Created for MYSQL instances in expense Dev"
  vpc_id         = data.aws_ssm_parameter.vpc_id.value
  common_tags    = var.common_tags

}