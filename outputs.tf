output "subnet-gateway" {
    value = google_compute_subnetwork.subnet-1.gateway_address
}

output "webserver-ips" {
    value = module.webservers.webserver-ips
}