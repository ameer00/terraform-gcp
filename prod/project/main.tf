// Configure the Google Cloud provider
provider "google" {
 version = "~> 1.13"
 credentials = "${file("${var.credentials}")}"
 project     = "${var.project}" 
 region      = "${var.region}"
}
