resource "aws_route53_record" "prod" {
  zone_id = "${var.hostedzone}"
  name    = "${var.env}"
  type    = "A"

  alias {
    name                   = "${aws_elb.prod.dns_name}"
    zone_id                = "${aws_elb.prod.zone_id}"
    evaluate_target_health = true
  }

  depends_on = ["aws_elb.prod"]
}

resource "aws_route53_record" "stage" {
  zone_id = "${var.hostedzone}"
  name    = "${var.env}-staging"
  type    = "A"

  alias {
    name                   = "${aws_elb.stage.dns_name}"
    zone_id                = "${aws_elb.stage.zone_id}"
    evaluate_target_health = true
  }

  depends_on = ["aws_elb.stage"]
}

resource "aws_route53_record" "dev" {
  zone_id = "${var.hostedzone}"
  name    = "${var.env}-dev"
  type    = "A"

  alias {
    name                   = "${aws_elb.dev.dns_name}"
    zone_id                = "${aws_elb.dev.zone_id}"
    evaluate_target_health = true
  }

  depends_on = ["aws_elb.dev"]
}
