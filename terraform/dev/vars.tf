  
# Input variable: Name of Google Cloud Storage bucket
variable "bucket_name" {
  //description = "The name of the Google Cloud Storage bucket. Must be globally unique."
  default = "terraform-state-my-bucket"
}

# Input variable: server port
variable "server_port" {
  //description = "The port the server will use for HTTP requests"
  default = ["80", "443", "22", "8080-8090", "9000"]
}