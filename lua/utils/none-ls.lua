local null_ls = require("null-ls")

-- hello my fre

local formatting = null_ls.builtins.formatting
--local completion = null_ls.builtins.completion

null_ls.setup({
  sources = {
    -- formant
    formatting.stylua.with({ filetypes = { "lua" } }),

    formatting.prettier.with({
      filetypes = { "html", "markdown", "css" },
    }),
  },
})
