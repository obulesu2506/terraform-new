locals {
  private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnt_ids.value) #Conversion of STringList to list
  app_alb_sg_id      = data.aws_ssm_parameter.app_alb_sg_id.value

}