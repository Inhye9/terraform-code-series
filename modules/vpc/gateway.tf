resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_eip" "nat" {
  vpc = true

  lifecycle {
    # prevent_destroy = true
  }

  tags = {
    Name = "${var.project_name}-nat"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public[element(keys(aws_subnet.public), 0)].id

  tags = {
    Name        = "${var.project_name}-ngw"
  }
}
