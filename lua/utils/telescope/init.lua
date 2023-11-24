require("utils.telescope.picker")

local telescope = require("telescope")
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")


telescope.setup({
  defaults = {
    prompt_position = "top",
    border = true,
    --borderchars = { "-", "|", "-", "|", "", " ", "", "" },
    sorting_strategy = "ascending",
    selection_strategy = "follow",
    initial_mode = "insert",
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.45,
        results_width = 0.2,
      },
      vertical = {
        prompt_position = "top",
        preview_height = 0.33,
        results_height = 0.19,
        mirror = true,
      },
      width = 0.98,
      height = 0.98,
    },
    wrap_results = false,
    selection_caret = " ",
    prompt_prefix = "   ",
    entry_prefix = "  ",
    multi_icon = "  ",
    hl_result_eol = true,
    cache_picker = {
      num_pickers = 20,
    },
    vimgrep_arguments = {
      "rg",
      "--color=always",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
    set_env = {
      COLORTERM = "truecolor",
    },
    git_worktrees = {
      toplevel = vim.env.HOME,
      gitdir = vim.env.HOME .. '/.cfg'
    },
    mappings = {
      n = {
        ["<C-p>"] = action_layout.toggle_preview,
        ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
      },
      i = {
        ["<C-p>"] = action_layout.toggle_preview,
        ["<C-u>"] = false,
        ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-n>"] = actions.cycle_previewers_prev,
      },
    },
  },
})
