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

resource "google_compute_instance" "default" {
  name         = "default"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      # This is the image created by Packer.
      image = "packer-1647529445"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    ssh-keys = "username:${file("id_rsa.pub")}"
  }
}

output "ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}
