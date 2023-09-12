variable "jenkins_name" {
  description = "The name of jenkins ec2"
  type        = string 
  default     = "tf-code-series-jenkins"
  
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "tf-jenkins-sg"
}

#variable "vpc_id" {
#  type        = string
#  description = "vpc_id"
#}

#variable "public_subnet_ids" {
#  type        = list(string)
#  description = "public subnet id"
#}

#variable "private_subnet_ids" {
#  type        = list(string)
#  description = "private subnet id"
#}

#variable "my_key_pair"{
#  description = "key pair for jenkins"
#  type 	      = string
#  default     = "ih-bastion-ec2-key"
#}


