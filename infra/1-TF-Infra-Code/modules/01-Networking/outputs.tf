output "vpc" {
  value = aws_vpc.vpc
}

output "elastic-ip-addr" {
  value = aws_eip.elastic-ip.public_ip
}

output "IGW-id" {
  value = aws_internet_gateway.igw.id
}


output "NGW-id" {
  value = aws_nat_gateway.nat-gw.id
}

output "public_subnets" {
  value = [aws_subnet.public-subnet-1, aws_subnet.public-subnet-2, aws_subnet.public-subnet-3]
}

output "private_subnets" {
  value = [aws_subnet.private-subnet-1, aws_subnet.private-subnet-2, aws_subnet.private-subnet-3]
}
