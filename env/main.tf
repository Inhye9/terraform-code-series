module "vpc" {
  source = "../modules/vpc"

  #project_name = var.project_name
}

module "developer-tools" {
  source = "../modules/developer-tools"

  project_name = var.project_name
}

module "ecr" {
  source = "../modules/ecr"

  project_name = var.project_name
}

#module "eks" {
#  source = "../modules/eks"
#
#  cluster_version    = "1.24"
#  vpc_id             = module.vpc.vpc_id
#  public_subnet_ids  = module.vpc.vpc_public_subnet_ids
#  private_subnet_ids = module.vpc.vpc_private_subnet_ids
#}


