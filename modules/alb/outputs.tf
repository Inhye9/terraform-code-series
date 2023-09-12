output "tf-pri-mgmt-alb-id" {
  value = aws_alb.tf-pri-mgmt-alb.id
  description = "tf-pri-mgmt-alb ID" 
}

output "tf-pri-mgmt-alb-sg-id" {
  value = aws_security_group.tf-pri-mgmt-alb-sg.id 
  description = "tf-pri-mgmt-alb SecurityGroup ID" 
}
