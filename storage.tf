## BUCKETS
resource "google_storage_bucket" "environment-buckets" {
  for_each = toset(var.environment_list)
  name     = "${lower(each.key)}_${var.project-id}"
  location = var.region
  versioning {
    enabled = true
  }
}