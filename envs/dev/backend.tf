terraform {
  backend "gcs" {
    bucket = "tf-states-1"
    prefix = "envs/dev"
  }
}
