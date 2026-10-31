variable "region" {
  type    = string
  default = "us-east-1"
}
variable "project" {
  type    = string
  default = "tenderready"
}
variable "env" {
  type    = string
  default = "dev"
}

variable "allowed_origins" {
  type        = list(string)
  description = "Website addresses allowed to upload to the bucket"
  default     = ["http://localhost:5173"]
}