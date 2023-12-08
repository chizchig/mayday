provider "google" {
  credentials = file("../rr-key.json")
  project = var.project_id
  region  = var.region
}
