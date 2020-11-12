  
# Input variable: Name of Google Cloud Storage bucket
variable "bucket_name" {
  default = "terraform-state-my-bucket"
}

# Input variable: server port
variable "server_port" {
  default = ["80", "443", "22", "8080", "8081", "9000", "10050", "10051"]
}