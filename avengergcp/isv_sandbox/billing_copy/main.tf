provider "google" {
  project     = var.project_id
  user_project_override = true
  credentials = var.credential_file
}

data "google_billing_account" "account" {
  billing_account = var.bill_account
}

data "google_project" "project" {
}

resource "google_billing_budget" "budget" {
  billing_account = var.bill_account
  display_name    = var.budget_name

  budget_filter {
    projects = ["projects/${data.google_project.project.number}"]
  }

  amount {
    specified_amount {
      currency_code = var.currency
      units = tostring(var.amount)
    }
  }

  
  dynamic "threshold_rules" {
    for_each = var.percents
    content {
      threshold_percent =threshold_rules.value
      
    }
  }

  dynamic "basis" {
    for_each = var.spend_basis
    content {
      spend_basis = basis.value
    }
  }

  
  
  all_updates_rule {
    monitoring_notification_channels = [google_monitoring_notification_channel.notification_channel.id,]
    disable_default_iam_recipients = true
  }
}

resource "google_monitoring_notification_channel" "notification_channel" {
  display_name = "Notification Channel"
  type         = "email"

  labels = {
    email_address = "avengergcp@gmail.com"
  }
}