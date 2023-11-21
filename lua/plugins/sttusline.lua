return {
  "sontungexpt/sttusline",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufEnter" },
  opts = {
    -- statusline_color = "#000000",
    statusline_color = "#2f2f2f",

    -- | 1 | 2 | 3
    -- recommended: 3
    laststatus = 3,
    disabled = {
      filetypes = {
         "NvimTree",
         "lazy",
      },
      buftypes = {
        "terminal",
      },
    },
    components = {
      "mode",
      "git-branch",
      "filename",
      --"git-diff",
      "%=",
      "diagnostics",
      "lsps-formatters",
      --"copilot",
      --"indent",
      --"encoding",
      "pos-cursor",
      --"pos-cursor-progress",
    },
  },
}
