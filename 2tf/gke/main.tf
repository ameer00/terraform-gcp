resource "google_container_cluster" "primary" {
  name                    = "${var.name}"
  zone                    = "${var.zone}"
  network                 = "${var.network}"
  subnetwork              = "vpc-${count.index}-nodes"
  initial_node_count      = 3
  private_cluster         = "true"
  master_ipv4_cidr_block  = "cluster-${count.index}_master_ip"
  ip_allocation_policy    = {
   cluster_secondary_range_name  = "vpc-${count.index}-pod"
   services_secondary_range_name = "vpc-${count.index}-svc1"
   }
}
