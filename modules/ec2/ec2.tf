resource "aws_instance" "bastion" {
  ami                         = "ami-0bd7691bf6470fe9c"
  ebs_optimized               = false
  instance_type               = "t3.micro"
  monitoring                  = false
  key_name                    = aws_key_pair.tf-bastion-key-pair.key_name
  #subnet_id                   = var.public_subnet_ids[0]
  subnet_id                   = module.vpc.public_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.bastion-sg.id]
  #iam_instance_profile        = aws_iam_instance_profile.ci.name
  associate_public_ip_address = true
  source_dest_check           = true 

  root_block_device {    
    volume_type           = "gp2"
    volume_size           = 100
    delete_on_termination = true 
  }

  tags = { 
    Name = "tf-bastion"
  }
}

resource "aws_instance" "jenkins" {
  ami                         = "ami-0bd7691bf6470fe9c"
  ebs_optimized               = false
  instance_type               = "t3.medium"
  monitoring                  = false
  #key_name                    = aws_key_pair.tf-key-pair.key_name
  key_name                    = aws_key_pair.tf-bastion-key-pair.key_name
  #subnet_id                   = var.private_subnet_ids[0]
  subnet_id                   = module.vpc.private_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  #iam_instance_profile        = aws_iam_instance_profile.ci.name
  #associate_public_ip_address = true
  source_dest_check           = true 

  root_block_device {    
    volume_type           = "gp2"
    volume_size           = 100
    delete_on_termination = true 
  }

  tags = { 
    Name = "tf-jenkins"
  }
}


