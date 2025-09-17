variable "project_id" {
  description = "Project ID to create resources in."
  type        = string
}

variable "name" {
  description = "Name of the GCS bucket."
  type        = string
}

variable "location" {
  description = "Location to place buckets at."
  type        = string
  default     = "us-central1"
}
