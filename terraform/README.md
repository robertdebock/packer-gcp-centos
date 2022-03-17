# Terraform

You can use this terraform code to spin up an instance based on the image built with Packer.

Change `main.tf` - google_compute_instance.default.boot_disk.initialize_params.image to the image created by Packer.

Once up and running, you can login and observe the specifics of you image.
