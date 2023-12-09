--local preview = require("utils.telescope.preview")

require("telescope").setup({
  pickers = {
    find_files = {
      preview = {
        hide_on_startup = true,
      },
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      layout_strategy = "horizontal",
    },
    spell_suggest = {
      layout_strategy = "cursor",
      layout_config = {
        width = 0.5,
        height = 0.5,
      },
    }
  },
})
