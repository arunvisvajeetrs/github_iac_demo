terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.6.0"
    }
  }
}

provider "github" {
  token = var.iac_github_token
  owner = "arunvisvajeetrs"
}

variable "iac_github_token" {
  description = " The Github token for authentication"
  type        = string
  sensitive   = true
}
