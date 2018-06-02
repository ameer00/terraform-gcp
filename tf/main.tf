// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("${var.credentials}")}"
 project     = "${var.project}" 
 region      = "${var.region}"
}

// Create VPC1000
resource "google_compute_network" "vpc" {
 name                    = "${var.vpc1}-vpc"
 auto_create_subnetworks = "false"
}

// Create Subnet - Nodes
resource "google_compute_subnetwork" "subnet" {
 name               = "${var.vpc1}-nodes"
 ip_cidr_range      = "${var.vpc1_node_subnet}"
 network            = "${var.vpc1}-vpc"
 depends_on         = ["google_compute_network.vpc"]
 region             = "${var.region}"
 secondary_ip_range = {
      range_name    = "${var.vpc1}-pod"
      ip_cidr_range = "${var.vpc1_pod_subnet}"
  }
 secondary_ip_range = {
      range_name    = "${var.vpc1}-svc1"
      ip_cidr_range = "${var.vpc1_svc1_subnet}"
  }
 secondary_ip_range = {
      range_name    = "${var.vpc1}-svc2"
      ip_cidr_range = "${var.vpc1_svc2_subnet}"
  }
 secondary_ip_range = {
      range_name    = "${var.vpc1}-svc3"
      ip_cidr_range = "${var.vpc1_svc3_subnet}"
  }
 secondary_ip_range = {
      range_name    = "${var.vpc1}-svc4"
      ip_cidr_range = "${var.vpc1_svc4_subnet}"
  }
}

// Create GKE Cluster in VPC1000
resource "google_container_cluster" "primary" {
  name                    = "${var.cluster1}"
  zone                    = "${var.zone}"
  network                 = "${var.vpc1}-vpc"
  subnetwork              = "${var.vpc1}-nodes"
  initial_node_count      = 3
  private_cluster         = "true"
  master_ipv4_cidr_block  = "${var.cluster1_master_ip}"
  ip_allocation_policy    = {
   cluster_secondary_range_name  = "${var.vpc1}-pod"
   services_secondary_range_name = "${var.vpc1}-svc1"
   }
}
