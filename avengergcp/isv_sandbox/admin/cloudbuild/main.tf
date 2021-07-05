resource "google_cloudbuild_trigger" "filename-trigger" {
  trigger_template {
    branch_name = "master"
    repo_name   = "infrastructure"
  }

  filename = "cloudbuild.yaml"
  project = var.project_id
}

# Create build and run
resource "null_resource" "gcloud" {
  provisioner "local-exec" {
    command = "gcloud builds submit --config=cloudbuild.yaml"
  }
}
