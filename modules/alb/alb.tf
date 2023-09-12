resource "aws_alb" "tf-pri-mgmt-alb" {
  name = "tf-pri-mgmt-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.tf-pri-mgmt-alb-sg.id]
  #subnets = var.private_subnet_ids 
  subnets = flatten([var.private_subnet_ids]) 

  enable_cross_zone_load_balancing = true
  enable_deletion_protection = true

  lifecycle { create_before_destroy = true }
}


resource "aws_alb_target_group" "tf-jenkins-tg" {
  name = "tf-jenkins-tg"
  port = 8080
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id 


  health_check {
    interval            = 30
    path                = "/login"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}


resource "aws_alb_target_group_attachment" "tf-jenkins-tg-attach" {
  target_group_arn = aws_alb_target_group.tf-jenkins-tg.arn
  target_id = var.jenkins_id 
  port = 8080
}


resource "aws_alb_listener" "tf-pri-mgmt-alb-listener"{
  load_balancer_arn = aws_alb.tf-pri-mgmt-alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.tf-jenkins-tg.arn
  }
}

