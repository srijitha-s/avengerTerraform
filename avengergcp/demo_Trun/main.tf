provider "google"{
    credentials = file("credentials.json")
    project = "myproject123-314006"
    region = "europe-north1"
    zone = "europe-north1-a"
}

resource "google_cloud_run_service" "default"{
    name = "demo"
    location = "europe-north1"

    template{
        spec{
            containers{
                image = "gcr.io/myproject123-314006/demo:latest"
            }
        }
    }

    traffic{
        percent =100
        latest_revision = true
    }
}