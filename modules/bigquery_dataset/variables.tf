variable "project_id" {
  description = "Project ID to create resources in."
  type        = string
}

variable "dataset_id" {
  description = "ID of the BigQuery dataset."
  type        = string
}

variable "location" {
  description = "Location for the dataset."
  type        = string
  default     = "us-central1"
}
