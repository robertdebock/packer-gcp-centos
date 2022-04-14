variable "project_id" {
  default = "roberts-project-23"
}

source "googlecompute" "default" {
  project_id          = var.project_id
  source_image_family = "centos-stream-9"
  ssh_username        = "packer"
  zone                = "us-central1-a"
}

build {
  sources = ["sources.googlecompute.default"]
  provisioner "shell" {
    script = "script.sh"
  }
}
