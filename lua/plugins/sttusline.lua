return {
  "sontungexpt/sttusline",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufEnter" },
  config = function()
    -- statusline_color = "#000000",
    require("sttusline").setup {
      statusline_color = "#",

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
      }
    }
  end
}
