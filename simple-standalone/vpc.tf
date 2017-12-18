resource "aws_vpc" "vpc1" {
    cidr_block = "${var.vpc1_cidr}"
    tags {
        Name = "${var.environment}-vpc1"
    }
}

#internet gateway for the VPC
resource "aws_internet_gateway" "igw-vpc1" {
    vpc_id = "${aws_vpc.vpc1.id}"
    tags {
        Name = "${var.environment}-igw"
    }
}


# Public Subnet Route Table
resource "aws_route_table" "PublicSubnetRouteTable" {
    vpc_id = "${aws_vpc.vpc1.id}"
    tags {
        Name = "${var.environment}-Public Subnet Route Table"
    }
}

resource "aws_route" "internet_access" {
  route_table_id = "${aws_route_table.PublicSubnetRouteTable.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw-vpc1.id}"
}

resource "aws_subnet" "PublicSubnet_az1" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "${var.public_subnet_cidr_az1}"
    map_public_ip_on_launch = true
    tags {
        Name = "${var.environment}-Public Subnet AZ1"
    }
}

resource "aws_route_table_association" "pub_az1" {
    subnet_id = "${aws_subnet.PublicSubnet_az1.id}"
    route_table_id = "${aws_route_table.PublicSubnetRouteTable.id}"
}
