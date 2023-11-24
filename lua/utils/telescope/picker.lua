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
    builtin = {
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.0,
      },
    },
    file_browers = {
      layout_strategy = "vertical",
      previewer = {
        hide_on_startup = true,
        msg_bg_fillchar = ">"
      }
    }
  },
  builtin = {
    fd = {
      preview = false,
    }
  }
})
