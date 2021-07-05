terraform {
  backend "gcs" {
    bucket  = "hpc-lab-bucket"
    prefix  = "admin/cloudbuild_trigger"
  }
}