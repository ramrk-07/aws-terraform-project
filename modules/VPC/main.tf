# ---------------------
# VPC
# ---------------------
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "project-vpc"
  }
}

# ---------------------
# PUBLIC SUBNETS
# ---------------------
resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
 availability_zone = element(var.azs, count.index)

 tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# ---------------------
# PRIVATE SUBNETS
# ---------------------
resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}


# ---------------------
# INTERNET GATEWAY
# ---------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "project-igw"
  }
}

# ---------------------
# PUBLIC ROUTE TABLE
# ---------------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Associate public subnets
resource "aws_route_table_association" "public_assoc" {
  count = length(var.public_subnets)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
