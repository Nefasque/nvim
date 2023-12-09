-- config file_browser extension
require("telescope._extensions.file_browser.config").setup({
  prompt = false,
  initial_mode = "normal",
  grouped = true,
  cwd_to_path = true,
  files = true,
  depth = 1,
  auto_depth = false,
  select_buffer = true,
  respect_gitignore = false,
  follow_symlinks = false,
  hide_parent_dir = true,
  collapse_dirs = false,
  hijack_netrw = true,
  prompt_path = true,
  display_stat = false,
})
