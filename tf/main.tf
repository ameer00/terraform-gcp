// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("${var.credentials}")}"
 project     = "${var.project}" 
 region      = "${var.region}"
}

// Create VPC 1000
resource "google_compute_network" "vpc" {
 name                    = "${var.vpc1}-vpc"
 auto_create_subnetworks = "false"
}

// Create Subnet - Nodes
resource "google_compute_subnetwork" "subnet" {
 name               = "${var.vpc1}-nodes"
 ip_cidr_range      = "${var.vpc1-node-subnet}"
 network            = "${var.vpc1}-vpc"
 depends_on         = ["google_compute_network.vpc"]
 region             = "${var.region}"
 secondary_ip_range = [
      range_name    = "${var.vpc1}-pod"
      ip_cidr_range = "${var.vpc1-pod-subnet}"
      ]
}
