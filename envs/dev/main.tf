module "gcs_bucket" {
  source     = "../../modules/gcs_bucket"
  project_id = var.project_id
  name       = var.bucket_name
  location   = var.region
}

module "bigquery_dataset" {
  source     = "../../modules/bigquery_dataset"
  project_id = var.project_id
  dataset_id = var.dataset_id
  location   = var.region
}

module "vm_instance" {
  source       = "../../modules/vm_instance"
  project_id   = var.project_id
  machine_name = var.machine_name
  zone         = var.zone
  machine_type = var.machine_type
  image        = var.image
  network      = var.network
}
