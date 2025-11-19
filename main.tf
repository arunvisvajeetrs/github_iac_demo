locals {
  repositories = [
    {
      name        = "tictactoe"
      description = "Add description"

      visibility = "public"
    },
    {
      name        = "Test_Actions"
      description = "This github repository is used for testing github actions"

      visibility = "public"
    },
  ]
}

import {
  for_each = { for repo in local.repositories : repo.name => repo }
  to = github_repository.manage_repos[each.value.name]
  id = each.key
}

resource "github_repository" "manage_repos" {
  for_each = { for repo in local.repositories : repo.name => repo }
  name        = each.value.name
  description = each.value.description

  visibility = each.value.visibility

  allow_auto_merge       = true
  delete_branch_on_merge = true

}
import {
  for_each = { for repo in local.repositories : repo.name => repo }
  to = github_branch_protection.bp[each.value.name]
  id = "${each.key}:main"
}

resource "github_branch_protection" "bp" {
  for_each = { for repo in local.repositories : repo.name => repo }
  repository_id = github_repository.manage_repos[each.key].node_id
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
