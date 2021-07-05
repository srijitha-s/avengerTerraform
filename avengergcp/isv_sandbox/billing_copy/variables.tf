variable "credential_file" {
  type = string
  default = "./credentials.json"
}

variable "bill_account" {
  type = string
  default = "01842A-778876-18E337"
} 

variable "project_id" {
  type = string
  default = "hpc-lab-316407"
}

variable "budget_name" {
  type = string
  default = "Billing Budget today3"
}

variable "amount" {
  description = "The amount to use as the budget"
  type = number
  default = 21804
}

variable "currency" {
  description = "The currency to use for the budget"
  type   = string
  default = "INR"
}

variable "percents" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded"
  type        = list(number)
  default     = [0.5, 0.7, 1.0]
}
variable "spend_basis" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded"
  type        = list(string)
  default     = ["CURRENT_SPEND","CURRENT_SPEND","FORECASTED_SPEND"]
}