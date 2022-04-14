# Packer on GCP

This repository demonstrates using Packer on GCP.

## Allow service

```shell
gcloud services enable sourcerepo.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable servicemanagement.googleapis.com
gcloud services enable storage-api.googleapis.com
```

## Find images

```shell
gcloud compute images list --project centos-cloud
```

## Create service account

```shell
gcloud iam service-accounts create packer \
  --project YOUR_GCP_PROJECT \
  --description="Packer Service Account" \
  --display-name="Packer Service Account"
```

## Build

```shell
packer build packer.pkr.hcl
packer build packer.pkr.json
```

The build takes a couple of minutes and result in:

```text
==> Builds finished. The artifacts of successful builds are:
--> googlecompute: A disk image was created: packer-1647529445
```

This `packer-1647529445` can be used in terraform, see the `terraform/` directory.
