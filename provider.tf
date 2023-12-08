provider "google" {
  credentials = file("${path.module}/rr-key.json")
  project = var.project_id
  region  = var.region
}
