variable "enabled" {
  type        = bool
  default     = true
  description = "Enables/disables the notification channel."
}

variable "notification_channels" {
  type = list
  description = "List of email ids"
  default =["avengergcp@gmail.com","srijitha.s@hcl.com"]
}