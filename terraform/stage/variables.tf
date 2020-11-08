// variable "region" {
//   default     = "eu-central-1"
// }

// variable "instance_type" {
//   default     = "t2.micro"
// }

variable "allow_ports" {
  default     = ["80", "443", "22", "8080", "8081"]
}

// variable "enable_detailed_monitoring" {
//   type    = bool
//   default = false
// }

// variable "common_tags" {
//   description = "Common Tags to apply to all resources"
//   type        = map        // 
//   default = {
//     Owner       = "Vova Verholyak"
//     Project     = "EPAM"
//     Environment_dev = "DEV"
//   }
// }
