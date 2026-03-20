terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.iac_github_token
  owner = "arunvisvajeetrs"
}

variable "iac_github_token" {
  description = "The github token for auth"
  type = string
  sensitive = true
}
