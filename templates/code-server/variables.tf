variable "dns" {
  default = ["192.168.1.1"]
}

variable "name" {
  description = "What name should be used for Git?"
  default = "First Last"
}

variable "email" {
  description = "What name should be used for Git?"
  default = "First.Last@domain.com"
}

variable "username" {
  description = "What is your GitHub username?"
  default = "user"
}

variable "repo" {
  description = "What repo to clone?"
  default = "docker-code-server"
  validation {
    condition = contains([
      "docker-code-server"
    ], var.repo)
    error_message = "Invalid repo!"
  }
}