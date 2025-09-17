variable "project_id" {
  description = "Project ID to create resources in."
  type        = string
}

variable "region" {
  description = "Region to place compute resources at."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Zone to place compute resource at."
  type        = string
  default     = "us-central1-c"
}

variable "network" {
  description = "Network to create compute resources in."
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnet to create compute resources in."
  type        = string
  default     = "default"
}

variable "machine_type" {
  description = "Machine type for GCE instance."
  type        = string
  default     = "e2-standard-2"
}

variable "image" {
  description = "Name of target image."
  type        = string
  default     = "ubuntu-minimal-2210-kinetic-amd64-v20230126"
}

variable "machine_name" {
  description = "Compute Instance name."
  type        = string
  default     = "vm-ubuntu-minimal-2210-kinetic-amd64-v20230126"
}
