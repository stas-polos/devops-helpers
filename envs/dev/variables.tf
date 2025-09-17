variable "project_id" {
  description = "Project ID to create resources in."
  type        = string
}

variable "region" {
  description = "Region for resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone for the VM instance"
  type        = string
  default     = "us-central1-c"
}

variable "bucket_name" {
  description = "Name of the private GCS bucket to create"
  type        = string
  default     = "private-gsc-bucket"
}

variable "dataset_id" {
  description = "ID of the BigQuery dataset to create"
  type        = string
}

variable "machine_name" {
  description = "Name of the Compute Engine instance"
  type        = string
  default     = "vm-e2-standard-2"
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "e2-standard-2"
}

variable "image" {
  description = "Ubuntu image family (LTS) for the VM"
  type        = string
  default     = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
}

variable "network" {
  description = "VPC network for the VM"
  type        = string
  default     = "default"
}
