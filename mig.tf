module "vm_instance_template" {
  source       = "terraform-google-modules/vm/google//modules/instance_template"
  version      = "~> 13.6"
  project_id   = var.project-id
  region       = var.region
  machine_type = "e2-micro"
  subnetwork   = google_compute_subnetwork.subnet-1.name
  service_account = {
    email  = var.instance_service_account
    scopes = []
  }
}

module "vm_mig" {
    source               = "terraform-google-modules/vm/google//modules/mig"
    version              = "~> 13.6"
    project_id           = var.project-id
    region               = var.region
    hostname             = "web-server"
    instance_template    = module.vm_instance_template.self_link
}