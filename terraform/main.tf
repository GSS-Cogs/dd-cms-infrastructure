terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}


provider "google" {
  project = "dd-cms"
  region  = "europe-west2"
  zone    = "europe-west2-b"
}

resource "google_compute_network" "vpc_network" {
  name = "dd-cms-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "dd-cms-main"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "fedora-cloud/fedora-35"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
