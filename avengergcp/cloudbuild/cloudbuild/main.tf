resource "google_cloudbuild_trigger" "filename-trigger" {
  trigger_template {
    branch_name = "master"
    repo_name   = "infrastructure"
  }

  filename = "cloudbuild.yaml"
  project = var.project_id
}