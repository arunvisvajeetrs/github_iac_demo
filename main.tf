locals {
  repositories = [
    {
      id          = "tictactoe"
      name        = "tictactoe"
      description = "Practice react with tictactoe"

      visibility = "public"
    },
    {
      id          = "Test_Actions"
      name        = "Test_Actions"
      description = "Practice react with tictactoe"

      visibility = "public"
    }
  ]
}
import {
  for_each = { for repo in local.repositories : repo.id => repo }
  id       = each.key
  to       = github_repository.manage_repos[each.value.name]
}

resource "github_repository" "manage_repos" {
  for_each = { for repo in local.repositories : repo.id => repo }
  name        = each.value.name
  description = each.value.description 

  visibility = each.value.visibility

  allow_auto_merge = true
  allow_merge_commit = false

  lifecycle {
    prevent_destroy = true
  }
}

import{
  for_each = { for repo in local.repositories : repo.id => repo }
  id       = "${each.key}:main"
  to       = github_branch_protection.bp[each.value.name]
}
resource "github_branch_protection" "bp" {
  for_each = { for repo in local.repositories : repo.id => repo }
  repository_id = github_repository.manage_repos[each.value.name].node_id
  # also accepts repository name
  # repository_id  = github_repository.example.name

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = false
  allows_force_pushes = false
  required_linear_history = true
  require_conversation_resolution = true
}
import {
  to = github_branch_protection.bp
  id = "tictactoe:main"
}

resource "github_branch_protection" "bp" {
  repository_id = github_repository.tictactoe.node_id
  # also accepts repository name
  # repository_id  = github_repository.example.name

  pattern                 = "main"
  enforce_admins          = true
  allows_deletions        = false
  required_linear_history = true

  required_pull_request_reviews {
    dismiss_stale_reviews = true

  }
  require_conversation_resolution = true
  allows_force_pushes             = false

}

