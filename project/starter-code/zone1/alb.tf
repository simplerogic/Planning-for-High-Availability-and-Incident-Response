
module "project_alb" {
   source             = "./modules/alb"
   ec2                = module.ec2.aws_instance
   ec2_sg             = module.ec2.ec2_sg
   subnet_id          = module.vpc.public_subnet_ids
   vpc_id             = module.vpc.vpc_id
}
