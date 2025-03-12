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