variable "dns" {
  default = "192.168.1.1"
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

variable "docker_image" {
  description = "What Docker image would you like to use for your workspace?"
  default     = "base"

  # List of images available for the user to choose from.
  # Delete this condition to give users free text input.
  validation {
    condition     = contains(["base", "node"], var.docker_image)
    error_message = "Invalid Docker image!"
  }

  # Prevents admin errors when the image is not found
  validation {
    condition     = fileexists("images/${var.docker_image}.Dockerfile")
    error_message = "Invalid Docker image. The file does not exist in the images directory."
  }
}