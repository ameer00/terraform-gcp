resource "google_compute_subnetwork" "subnet" {
 name               = "${var.name}"
 project            = "${var.project}"
 ip_cidr_range      = "${var.ip_range}"
 network            = "${var.network}"
 region             = "${var.region}"
 secondary_ip_range = {
      range_name    = "${var.network}-pod"
      ip_cidr_range = "${var.network}_subnet_pod"
  }
 secondary_ip_range = {
      range_name    = "${var.network}-svc1"
      ip_cidr_range = "${var.network}_subnet_svc1"
  }
 secondary_ip_range = {
      range_name    = "${var.network}-svc2"
      ip_cidr_range = "${var.network}_subnet_svc2"
  }
 secondary_ip_range = {
      range_name    = "${var.network}-svc3"
      ip_cidr_range = "${var.network}_subnet_svc3"
  }
 secondary_ip_range = {
      range_name    = "${var.network}-svc4"
      ip_cidr_range = "${var.network}_subnet_svc4"
  }
}
