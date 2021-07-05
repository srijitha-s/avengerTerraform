provider "google" {
  version = "~> 3.67.0"
  project = var.project
  region  = var.region
  credentials = file("credentials.json")
}

 

# Create build and run
resource "null_resource" "gcloud" {
  provisioner "local-exec" {
    command = "gcloud builds submit --config=cloudbuild.yaml"
  }
}

 

# Deploy image to Cloud Run
resource "google_cloud_run_service" "mywebapp" {
  name     = "mywebapp"
  location = var.region
  template {
    spec {
      containers {
        image = "gcr.io/myproject123-314006/tomcat"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}

 

# Create public access
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}
# Enable public access on Cloud Run service
resource "google_cloud_run_service_iam_policy" "mywebapp" {
  location    = google_cloud_run_service.mywebapp.location
  project     = google_cloud_run_service.mywebapp.project
  service     = google_cloud_run_service.mywebapp.name
  policy_data = data.google_iam_policy.noauth.policy_data
}

 

# Return service URL
output "url" {
  value = "${google_cloud_run_service.mywebapp.status[0].url}"
}