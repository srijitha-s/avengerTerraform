resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = "CPU utilization and filestore"
  enabled      = true
  combiner     = "OR"
  notification_channels = ["projects/hpc-lab-316407/notificationChannels/9612192781086906899","projects/hpc-lab-316407/notificationChannels/617403293521240308","projects/hpc-lab-316407/notificationChannels/1664761978761983337"]
  
  conditions   {
    display_name = "Alert on 50% cpu utilization"
    
    condition_threshold  {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
      
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.5
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_NONE"
      }
    }
  
  }

  conditions   {
    display_name = "Alert for used disk space for filestore"
    
    condition_threshold  {
      filter          = "metric.type=\"file.googleapis.com/nfs/server/used_bytes_percent\" AND resource.type=\"filestore_instance\""
      
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_NONE"
      }
    }
  }
}