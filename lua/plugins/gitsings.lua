local is_repo_git = require("utils.init").is_repo_git

return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signcolumn = false,
    numhl = true,
    max_file_length = 10000,
  },
  cond = is_repo_git(),
}
