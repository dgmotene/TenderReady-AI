variable "name_prefix" {
  type = string
  description = "Prefix for resourse names, e.g tenterready-dev"
}

variable "account_id" {
  type = string
  description = "AWS acc ID, added to the backetname to make it unique"
}

variable "allowed_origins" {
  type = list(string)
  description = "Website addressed allowed to upload to the bucket"
}

variable "retention_days" {
  type = number
  description = "Days before stored files are deleted"
  default = 3
}
