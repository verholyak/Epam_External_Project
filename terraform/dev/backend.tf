
# Define Terraform backend using a Google Cloud Storage bucket for storing the Terraform state
terraform {
    backend "gcs" {
      bucket  = "terraform-state-my-bucket"
      prefix  = "terraform-state/terraform.tfstate"
      credentials = "gcp-creds.json"
  }
}
// depends_on = ["google_storage_bucket.terraform_state"]
