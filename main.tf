### PROVIDER
provider "google" {
  project = var.project-id
  region  = var.region
  zone    = var.zone
}

module "webservers" {
  source = "./modules/webservers"
  project_id = var.project-id
  server_settings = var.environment_instance_settings
  region = var.region
  zone = var.zone
  network_interface = {
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
  }
}

#REDIS
resource "google_redis_instance" "redis" {
  name               = var.environment_instance_settings[var.target_environment].redis.name
  tier               = var.environment_instance_settings[var.target_environment].redis.tier
  memory_size_gb     = var.environment_instance_settings[var.target_environment].redis.memory_size_gb
  location_id        = var.zone
  authorized_network = data.google_compute_network.default.id
}