resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
  cidr_block        = each.value

  tags = {
    Name                                        = "${var.project_name}-public-subnet"
    #"kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
  cidr_block        = each.value

  tags = {
    Name                                        = "${var.project_name}-private-subnet"
    #"kubernetes.io/cluster/${var.project_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}
