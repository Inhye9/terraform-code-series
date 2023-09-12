output "bastion_id" {
  value       = aws_instance.bastion.id 
  description = "bastion ec2 id"
}

output "jenkins_id" {
  value       = aws_instance.jenkins.id 
  description = "jenkins ec2 id"
}

output "bastion_sg_id" {
  value       = aws_security_group.bastion-sg.id 
  description = "bastion EC2 Security Group ID"
}

output "jenkins_sg_id" {
  value       = aws_security_group.jenkins-sg.id 
  description = "jenkins EC2 Security Group ID"
}
