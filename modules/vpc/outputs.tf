output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "vpc id"
}

output "vpc_private_subnet_ids" {
  value = [
    for az, subent in aws_subnet.private :
    subent.id
  ]
  description = "vpc private subnets ids"
}

output "vpc_public_subnet_ids" {
  value = [
    for az, subent in aws_subnet.public :
    subent.id
  ]
  description = "vpc public subnets ids"
}

output "vpc_cidr" {
  value       = aws_vpc.vpc.cidr_block
  description = "vpc cidr block"
}
