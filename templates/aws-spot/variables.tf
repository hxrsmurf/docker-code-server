
variable "region" {
  description = "What region should your workspace live in?"
  default     = "us-east-1"
  validation {
    condition = contains([
      "us-east-1",
    ], var.region)
    error_message = "Invalid region!"
  }
}

variable "subnet_id" {
  description = "What subnet in us-east-1a?"
  default = "subnet-0d8fa1295c21f9ead"
}

variable "access_key" {
  description = "AWS Access Key"
  default = "access"
}

variable "secret_key" {
  description = "AWS Secret Key"
  default = "secret"
}