return {
  "tpope/vim-fugitive",
  cmd = {"G", "Git"},
  keys = {
    {"<leader>ga", ":Git fetch --all -p<cr>", desc = "git fetch"},
    {"<leader>gp", ":Git pull<cr>", desc = "git pull"},
    {"<leader>gl", ":Git log --oneline --decorate --all --graph<cr>", desc = "git log"},
  }
}
