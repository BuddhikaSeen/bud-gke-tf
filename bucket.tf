resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket_name
  location      = "US"
  storage_class = "STANDARD"

  # Set to true if you want to allow deleting non-empty buckets.
  force_destroy = false

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
