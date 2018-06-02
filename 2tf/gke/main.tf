resource "google_container_cluster" "primary" {
  name                    = "${var.name}"
  zone                    = "${var.zone}"
  network                 = "${var.network}"
  subnetwork              = "${var.subnetwork}"
  initial_node_count      = 3
  private_cluster         = "true"
  master_ipv4_cidr_block  = "${var.master_ip}"
  ip_allocation_policy    = {
   cluster_secondary_range_name  = "${var.secondary_pod}"
   services_secondary_range_name = "${var.secondary_svc}"
   }
}
