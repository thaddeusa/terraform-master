resource "aws_security_group" "amz-linux-sg" {
    name = "${var.environment}-amz-linux-sg"
    description = "Allow incoming connections for web, ssh traffic."
    vpc_id = "${aws_vpc.vpc1.id}"
    tags {
        Name = "${var.environment}-EC2 Security Group"
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "TCP"
        cidr_blocks = ["${var.vpc1_cidr}"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}
