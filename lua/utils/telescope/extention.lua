local fb_actions = require "telescope".extensions.file_browser.actions


-- config file_browser extension
require("telescope._extensions.file_browser.config").setup({
  mappings = {
    -- go to directory parent
    ["n"] = {
      ["h"] = fb_actions.goto_parent_dir,
    }
  },
  prompt = false,
  initial_mode = "normal",
  grouped = true,
  cwd_to_path = true,
  files = true,
  depth = 1,
  auto_depth = false,
  select_buffer = true,
  respect_gitignore = false,
  follow_symlinks = true,
  hide_parent_dir = true,
  collapse_dirs = false,
  hijack_netrw = true,
  prompt_path = false,
  display_stat = false,
})
