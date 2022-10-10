locals {
    host_name = "${var.prefix}${var.application}${var.env}${var.location}${var.infra_type}${var.sequence}${var.resource_type}"
}