import {
  to = github_repository.tictactoe
  id = "tictactoe"
}

resource "github_repository" "tictactoe" {
  name        = "tictactoe"
  description = "Add description"

  visibility = "public"

}
