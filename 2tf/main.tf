module "project" {
 source      = "/project"
 credentials = "${file("${var.credentials}")}"
 project     = "${var.project}" 
 region      = "${var.region}"
}

module "vpc" {
  source     = "/vpc"
  name       = "vpc1000"
}
