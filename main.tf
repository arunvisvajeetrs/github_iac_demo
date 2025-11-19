import {
  to = github_repository.tictactoe
  id = "tictactoe"
}

resource "github_repository" "tictactoe" {
  name        = "tictactoe"
  description = "Add description"

  visibility = "public"

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

