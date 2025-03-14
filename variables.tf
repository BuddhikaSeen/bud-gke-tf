variable "project_id" {}
variable "region" {
  default = "us-central1"
}
variable "cluster_name" {
  default = "bud-gke-cluster"
}


variable "zone" {
  description = "GCP zone"
  default     = "us-central1-a"
}

variable "bucket_name" {
  description = "The name of the bucket to create"
  default = "bud-gke-bucket"
}