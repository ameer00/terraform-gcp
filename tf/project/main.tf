provider "google" {
 region = "${var.region}"
}

resource "google_project" "project" {
 name            = "${var.name}"
}
