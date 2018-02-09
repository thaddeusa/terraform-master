resource "aws_instance" "amz-linux" {
    ami = "${lookup(var.amis_amzlinux, var.aws_region)}"
    instance_type = "${var.instance_type}"
    key_name = "${var.aws_key_name}"
    vpc_security_group_ids = ["${aws_security_group.amz-linux-sg.id}"]
    subnet_id = "${aws_subnet.PublicSubnet_az1.id}"
    associate_public_ip_address = true
    tags {
        Name = "${var.environment}-amz-linux"
    }
  }
