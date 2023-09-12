#resource "aws_key_pair" "tf-key-pair" {
#  key_name   = "tf-key-pair"
#  
#  public_key = file("/root/terraform/.ssh/tf-key-pair.pub")
#  
#  tags = {
#  	description = "terraform key pair import"
#  }
#} 

resource "tls_private_key" "tf-bastion-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-bastion-key-pair" {
  key_name   = "tf-bastion-key-pair"
  public_key = tls_private_key.tf-bastion-key.public_key_openssh
} 

resource "local_file" "tf-bastion-key-pair-local" {
  filename        = "/root/terraform/.ssh/keypair/tf-bastion-key-pair.pem"
  content         = tls_private_key.tf-bastion-key.private_key_pem
  file_permission = "0600"
}

resource "tls_private_key" "tf-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "tf-key-pair" {
  key_name   = "tf-key-pair"
  public_key = tls_private_key.tf-key.public_key_openssh
} 

resource "local_file" "tf-key-pair-local" {
  filename        = "/root/terraform/.ssh/keypair/tf-key-pair.pem"
  content         = tls_private_key.tf-key.private_key_pem
  file_permission = "0600"
}
