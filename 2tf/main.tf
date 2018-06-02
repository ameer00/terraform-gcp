module "project" {
 source      = "./project"
 credentials = "${file("${var.credentials}")}"
 project     = "${var.project}" 
 region      = "${var.region}"
}

module "vpc" {
  source     = "./vpc"
  vpc        = "vpc1000"
}
 
module "subnet" {
  source      = "./subnet"
  name        = "subnet1"
  project     = "${var.project}"
  region      = "${var.region}"
  network     = "vpc1000"
  ip_range    = "172.16.0.0/22"
  pod_subnet  = "10.0.0.0/14"
  svc1_subnet = "192.168.0.0/24"
  svc2_subnet = "192.168.1.0/24"
  svc3_subnet = "192.168.2.0/24"
  svc4_subnet = "192.168.3.0/24"
}
