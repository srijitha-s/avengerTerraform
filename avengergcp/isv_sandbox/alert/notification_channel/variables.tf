variable "project_id" {
  type = string
  default = "hpc-lab-316407"
}

# --------------------------------------------------------------------

variable "channel_name" {
  type        = string
  description = "Name to be displayed"
  default = "orange"
}

variable "channel_type" {
  type        = string
  description = "Type of the notification channel"
  default     = "email"
}

variable "address" {
  type        = string
  description = "List of email ids"
  //"website-oncall@example.com"
  default = "orange123@gmail.com"
}