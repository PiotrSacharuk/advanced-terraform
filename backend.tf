# execute terraform init -backend-config="bucket=remotestate_${var.project-id}"
terraform {
  backend "gcs" {
    prefix = "terraform/state"
  }
}
