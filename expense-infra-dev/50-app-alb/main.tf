module "alb" {
  source   = "terraform-aws-modules/alb/aws"
  internal = true #By default, ALB will get created internal i.e., private. If we need to create Public ALB(ALB created on public subnets), then need to mention false

  #expense-dev-app-alb
  name                       = "${var.project_name}-${var.environment}-app-alb"
  vpc_id                     = data.aws_ssm_parameter.vpc_id.value
  subnets                    = local.private_subnet_ids
  create_security_group      = false #By default, SG will get created with out security group rules i.e., ingress/egress
  security_groups            = [local.app_alb_sg_id]
  enable_deletion_protection = false

  tags = merge(
    var.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-app-alb"
    }
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = module.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1> Hello I am from Backend APP ALB </h1>"
      status_code  = "200"
    }
  }
}
resource "aws_route53_record" "app_alb" {
  zone_id = var.zone_id
  name    = "*.app-dev.${var.domain_name}"
  type    = "A"

  #these are Alias ALB DNS Name and Zone information

  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = false
  }

}