resource "aws_security_group" "bastion-sg" {
  name 			  = "tf-bastion-sg" 
  vpc_id		  = module.vpc.vpc_id 
  #subnet_id              = var.public_subnet_ids[0]

  ingress {
    from_port   = 22 
    to_port     = 22 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    "Name" = "tf-bastion-sg" 
  }
}


resource "aws_security_group" "jenkins-sg" {
  name 			  = "tf-jenkins-sg" 
  vpc_id		  =  module.vpc.vpc_id

  ingress = [{
      from_port   = 22 
      to_port     = 22 
      protocol    = "tcp"
      security_groups = [aws_security_group.bastion-sg.id]
    },
    {
      from_port   = 80 
      to_port     = 80 
      protocol    = "tcp"
      security_groups = [module.alb.tf-pri-mgmt-alb-sg-id]
    }] 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    "Name" = "tf-jenkins-sg" 
  }
}


