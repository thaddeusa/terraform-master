provider "aws" {
    version = "~> 1.6"
    region = "${var.aws_region}"
    profile = "ecs"
}
