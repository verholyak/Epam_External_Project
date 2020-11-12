
// export GOOGLE_CLOUD_KEYFILE_JSON="C:\git_epam\gcp-creds.json"

# Configure the Google Cloud provider
provider "google" {
  credentials = file("gcp-creds.json")
  project = "prod-264511"
  region  = "europe-west4"
}

# Create a Google Cloud Storage Bucket
resource "google_storage_bucket" "terraform_state" {
  name          = "${var.bucket_name}"
  force_destroy = true
}

# Create a Google Compute Firewall
resource "google_compute_firewall" "instance" {
  name    = "server-dev-test"
  network = "default"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = "${var.server_port}"
  }
}

# Create a Google Compute instance
resource "google_compute_instance" "dev-test" {
  name          = "server-dev-test"
  machine_type  = "e2-medium"
  zone          = "europe-west4-a"
  metadata_startup_script = file("user-data-docker.sh")

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  
  tags = ["terraform-dev-test"]
  
}