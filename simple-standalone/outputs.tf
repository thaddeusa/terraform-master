output "vpc1_id" {
  value = "${aws_vpc.vpc1.id}"
}
output "public_subnet_az1_id" {
  value = "${aws_subnet.PublicSubnet_az1.id}"
}
output "environment" {
    value = "${var.environment}"
}
output "region" {
    value = "${var.aws_region}"
}
output "pub_ip" {
  value = "${aws_instance.amz-linux.public_ip}"
}
