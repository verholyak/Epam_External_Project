# Output variable: Google Cloud Storage Bucket
output "storage_bucket_self_link" {
  value = "${google_storage_bucket.terraform_state.self_link}"
}

# Output variable: Public IP address
output "public_ip" {
  value = "${google_compute_instance.dev-test.network_interface.0.access_config.0.nat_ip}"
}