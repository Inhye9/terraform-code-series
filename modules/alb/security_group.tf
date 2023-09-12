resource "aws_security_group" "tf-pri-mgmt-alb-sg" {
  name        = "tf-pri-mgmt-alb-sg"
  description = "tf-pri-mgmt-alb-sg" 
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80 
    to_port     = 80 
    protocol    = "tcp"
    cidr_blocks = [ module.vpc.vpc_cidr ]
  }
 
  egress {
    from_port   = 80 
    to_port     = 80 
    protocol    = "tcp"
    cidr_blocks = [ module.vpc.vpc_cidr ]
    security_groups = [ module.ec2.jenkins_sg_id]
    #ipv6_cidr_blocks = [ aws_vpc.vpc.ipv6_cidr_block ]
  }

  tags = {
    Name        = "tf-pri-mgmt-alb-sg"
  }
}
