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

provider "github" {
  owner = "arunvisvajeetrs"

  app_auth {
    id              = var.github_app_id
    installation_id = var.github_installation_id
    pem_file        = file(var.github_app_private_key)
  }
}
variable "iac_github_token" {
  description = "The Github token for authentication"
  type        = string
  sensitive   = true
}

variable "github_app_private_key" {
  description = "Private key for the GitHub App"
  type        = string
  sensitive   = true
}
variable "github_app_id" {
  description = "App ID for the GitHub App"
  type        = string
  sensitive   = true
}
variable "github_installation_id" {
  description = "Installation ID for the GitHub App"
  type        = string
  sensitive   = true
}