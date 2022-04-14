terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.13.0"
    }
  }
}

provider "google" {
  project = "roberts-project-23"
  region  = "us-central1"
}

resource "google_compute_network" "default" {
  name = "packer"
}

resource "google_compute_firewall" "default" {
  name = "packer"
  network = google_compute_network.default.id
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "default" {
  name         = "default"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      # This is the image created by Packer.
      image = "packer-1649927399"
    }
  }
  network_interface {
    network = "packer"
    access_config {}
  }
  metadata = {
    ssh-keys = "username:${file("id_rsa.pub")}"
  }
}

# TODO: Allow SSH traffic.

output "ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}
