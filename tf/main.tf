// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("${var.credentials}")}"
 project     = "${var.project}" 
 region      = "${var.region}"
}

// Create VPCs
resource "google_compute_network" "vpc" {
 count                   = 3
 name                    = "vpc_${count.index}"
 auto_create_subnetworks = "false"
}

// Create Subnet - Nodes
resource "google_compute_subnetwork" "subnet" {
 count              = 3
 name               = "vpc_${count.index}_nodes"
 ip_cidr_range      = "vpc_${count.index}_node_subnet}"
 network            = "vpc_${count.index}"
 depends_on         = ["google_compute_network.vpc"]
 region             = "${var.region}"
 secondary_ip_range = {
      range_name    = "vpc_${count.index}_pod"
      ip_cidr_range = "vpc_${count.index}_pod_subnet}"
  }
 secondary_ip_range = {
      range_name    = "vpc_${count.index}_svc1"
      ip_cidr_range = "vpc_${count.index}_svc1_subnet}"
  }
 secondary_ip_range = {
      range_name    = "vpc_${count.index}_svc2"
      ip_cidr_range = "vpc_${count.index}_svc2_subnet}"
  }
 secondary_ip_range = {
      range_name    = "vpc_${count.index}_svc3"
      ip_cidr_range = "vpc_${count.index}_svc3_subnet}"
  }
 secondary_ip_range = {
      range_name    = "vpc_${count.index}_svc4"
      ip_cidr_range = "vpc_${count.index}_svc4_subnet}"
  }
}

// Create GKE Clusters
resource "google_container_cluster" "primary" {
  count                   = 3
  name                    = "cluster_${count.index}"
  zone                    = "${var.zone}"
  network                 = "vpc_${count.index}"
  subnetwork              = "vpc_${count.index}_nodes"
  initial_node_count      = 3
  private_cluster         = "true"
  master_ipv4_cidr_block  = "cluster_${count.index}_master_ip}"
  ip_allocation_policy    = {
   cluster_secondary_range_name  = "vpc_${count.index}_pod"
   services_secondary_range_name = "vpc_${count.index}_svc1"
   }
}
