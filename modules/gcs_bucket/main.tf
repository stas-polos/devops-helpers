resource "google_storage_bucket" "bucket" {
  project                     = var.project_id
  name                        = var.name
  location                    = var.location

  versioning {
    enabled = true
  }
}
