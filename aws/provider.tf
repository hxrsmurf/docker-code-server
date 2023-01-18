terraform {
  cloud {
    organization = "aws-kevin"

    workspaces {
      name = "role"
    }
  }
}