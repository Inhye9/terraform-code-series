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

module "ec2" {
  source = "../modules/ec2"
}

module "alb" {
  source = "../modules/alb"
}
