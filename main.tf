terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  project     = "project-231c402f-f9ad-427f-b80"
  region      = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "project-231c402f-f9ad-427f-b80-terra-bucket"
  location      = "US"
  force_destroy = true
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}