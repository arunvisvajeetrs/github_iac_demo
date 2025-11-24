locals {
  repositories = [
    {
      name        = "tictactoe"
      description = "Practice react with tictactoe"

      visibility = "public"
    },
    {
      name        = "Test_Actions"
      description = "Practice react with tictactoe"

      visibility = "public"
    }
  ]
}
import {
  for_each = { for repo in local.repositories : repo.name => repo }
  id       = each.key
  to       = github_repository.manage_repos[each.value.name]
}

resource "github_repository" "manage_repos" {
  for_each = { for repo in local.repositories : repo.name => repo }
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
  for_each = { for repo in local.repositories : repo.name => repo }
  id       = "${each.key}:main"
  to       = github_branch_protection.bp[each.value.name]
}
resource "github_branch_protection" "bp" {
  for_each = { for repo in local.repositories : repo.name => repo }
  repository_id = github_repository.manage_repos[each.value.name].node_id
  # also accepts repository name
  # repository_id  = github_repository.example.name

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

}