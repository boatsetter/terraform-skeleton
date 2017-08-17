resource "aws_route53_zone" "main" {
  name = "boatsetter.io"

  vpc_id = "${data.aws_subnet.vpc.vpc_id}"
}

resource "aws_route53_record" "prod" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "${var.env}.live"
  type    = "A"

  records = ["${aws_instance.prod.private_ip}"]

  depends_on = ["aws_instance.prod"]
}

resource "aws_route53_record" "stage" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "${var.env}.staging"
  type    = "A"

  records = ["${aws_instance.stage.private_ip}"]

  depends_on = ["aws_instance.stage"]
}

resource "aws_route53_record" "dev" {
  zone_id = "${aws_route53_zone.main.zone_id}"
  name    = "${var.env}.dev"
  type    = "A"

  records = ["${aws_instance.dev.private_ip}"]

  depends_on = ["aws_instance.dev"]
}
