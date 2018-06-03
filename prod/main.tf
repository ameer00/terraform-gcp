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
  name        = "subnet1"
  project     = "${var.project}"
  region      = "${var.region}"
  network     = "${module.vpc1000.name}"
  ip_range    = "172.16.0.0/22"
  pod_subnet  = "10.0.0.0/14"
  svc1_subnet = "192.168.0.0/24"
  svc2_subnet = "192.168.1.0/24"
  svc3_subnet = "192.168.2.0/24"
  svc4_subnet = "192.168.3.0/24"
}

module "gke1000" {
  source        = "./gke"
  name          = "cluster-1000"
  zone          = "us-central1-f"
  network       = "${module.vpc1000.name}"
  subnetwork    = "${module.subnet1.self_link}"
  master_ip     = "172.18.0.0/28"
  secondary_pod = "${module.vpc1000.name}-pod"
  secondary_svc = "${module.vpc1000.name}-svc1"
}
 
module "vpc2000" {
  source     = "./vpc"
  vpc        = "vpc2000"
}

module "subnet2" {
  source      = "./subnet"
  name        = "subnet2"
  project     = "${var.project}"
  region      = "${var.region}"
  network     = "${module.vpc2000.name}"
  ip_range    = "172.16.0.0/21"
  pod_subnet  = "10.0.0.0/13"
  svc1_subnet = "192.168.0.0/24"
  svc2_subnet = "192.168.1.0/24"
  svc3_subnet = "192.168.2.0/24"
  svc4_subnet = "192.168.3.0/24"
}

module "gke2000" {
  source        = "./gke"
  name          = "cluster-2000"
  zone          = "us-central1-f"
  network       = "${module.vpc2000.name}"
  subnetwork    = "${module.subnet2.self_link}"
  master_ip     = "172.18.0.0/28"
  secondary_pod = "${module.vpc2000.name}-pod"
  secondary_svc = "${module.vpc2000.name}-svc1"
}
 
module "vpc4000" {
  source     = "./vpc"
  vpc        = "vpc4000"
}

module "subnet4" {
  source      = "./subnet"
  name        = "subnet4"
  project     = "${var.project}"
  region      = "${var.region}"
  network     = "${module.vpc4000.name}"
  ip_range    = "172.16.0.0/20"
  pod_subnet  = "10.0.0.0/12"
  svc1_subnet = "192.168.0.0/24"
  svc2_subnet = "192.168.1.0/24"
  svc3_subnet = "192.168.2.0/24"
  svc4_subnet = "192.168.3.0/24"
}

module "gke4000" {
  source        = "./gke"
  name          = "cluster-4000"
  zone          = "us-central1-f"
  network       = "${module.vpc4000.name}"
  subnetwork    = "${module.subnet4.self_link}"
  master_ip     = "172.18.0.0/28"
  secondary_pod = "${module.vpc4000.name}-pod"
  secondary_svc = "${module.vpc4000.name}-svc1"
}
 
module "vpc8000" {
  source     = "./vpc"
  vpc        = "vpc8000"
}

module "subnet8" {
  source      = "./subnet"
  name        = "subnet8"
  project     = "${var.project}"
  region      = "us-west1"
  network     = "${module.vpc8000.name}"
  ip_range    = "172.16.0.0/19"
  pod_subnet  = "10.0.0.0/11"
  svc1_subnet = "192.168.0.0/24"
  svc2_subnet = "192.168.1.0/24"
  svc3_subnet = "192.168.2.0/24"
  svc4_subnet = "192.168.3.0/24"
}

module "gke8000" {
  source        = "./gke"
  name          = "cluster-8000"
  zone          = "us-west1-a"
  network       = "${module.vpc8000.name}"
  subnetwork    = "${module.subnet8.self_link}"
  master_ip     = "172.18.0.0/28"
  secondary_pod = "${module.vpc8000.name}-pod"
  secondary_svc = "${module.vpc8000.name}-svc1"
}
