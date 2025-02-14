module "vpc" {
    source = "../terraform-aws-vpc" # This path is valid if the reference module present in the local
    #source = "git::https://github.com/obulesu2506/terraform-new.git?ref=terraform-aws-vpc/main" # This syntax will work if we have valid git workspace and in realtime, need to indicate like this
    project_name = var.project_name
    environment = var.environment
    vpc_cidr = var.vpc_cidr
    common_tags = var.common_tags
    vpc_tags = var.vpc_tags
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs
    is_peering_required = true
       

  
}