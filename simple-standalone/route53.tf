resource "aws_route53_zone" "taa" {
    name = "taa.ecsteam.io"
}
resource "aws_route53_record" "jumpbox" {
    zone_id = "${aws_route53_zone.taa.zone_id}"
    name = "jumpbox.taa.ecsteam.io"
    type = "CNAME"
    ttl = "30"
    records = ["${aws_instance.amz-linux.public_dns}"]
}
