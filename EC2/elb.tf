resource "aws_elb" "prod" {
  name               = "Prod-${var.env}"
  availability_zones = ["${data.aws_subnet.vpc.availability_zone}"]

  security_groups = ["${aws_security_group.elb_sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"

    lb_port     = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }

  instances                 = ["${aws_instance.prod.id}"]
  cross_zone_load_balancing = false
  idle_timeout              = 400

  tags {
    Name        = "production-elb-${var.env}"
    env         = "Prod"
    application = "${var.env}"
    role        = "${var.env}"
  }

  depends_on = ["aws_instance.prod", "aws_security_group.elb_sg"]
}

resource "aws_elb" "stage" {
  name               = "Stage-${var.env}"
  availability_zones = ["${data.aws_subnet.vpc.availability_zone}"]

  security_groups = ["${aws_security_group.elb_sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"

    lb_port     = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }

  instances                 = ["${aws_instance.stage.id}"]
  cross_zone_load_balancing = false
  idle_timeout              = 400

  tags {
    Name        = "staging-elb-${var.env}"
    env         = "Staging"
    application = "${var.env}"
    role        = "${var.env}"
  }

  depends_on = ["aws_instance.stage", "aws_security_group.elb_sg"]
}

resource "aws_elb" "dev" {
  name               = "Dev-${var.env}"
  availability_zones = ["${data.aws_subnet.vpc.availability_zone}"]

  security_groups = ["${aws_security_group.elb_sg.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"

    lb_port     = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }

  instances                 = ["${aws_instance.dev.id}"]
  cross_zone_load_balancing = false
  idle_timeout              = 400

  tags {
    Name        = "dev-elb-${var.env}"
    env         = "Dev"
    application = "${var.env}"
    role        = "${var.env}"
  }

  depends_on = ["aws_instance.dev", "aws_security_group.elb_sg"]
}
