module "project" {
 source      = "./project"
 credentials = "${file("${var.credentials}")}"
 project     = "${var.project}" 
 region      = "${var.region}"
}

module "vpc1000" {
  source     = "./vpc"
  vpc        = "vpc1000"
}
 
module "subnet1" {
  source      = "./subnet"
  somevar     = "${module.vpc1000.name}"
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
 
module "gke1000" {
  source        = "./gke"
  somevar       = "${module.subnet1.ip_range}"
  name          = "cluster-1000"
  zone          = "us-central1-f"
  network       = "vpc1000"
  subnetwork    = "subnet1"
  master_ip     = "172.18.0.0/28"
  secondary_pod = "vpc1000-pod"
  secondary_svc = "vpc1000-svc1"
}
