local null_ls = require("null-ls")

-- hello my fre

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,

    -- snippet
    null_ls.builtins.completion.luasnip,

    -- formant
    null_ls.builtins.formatting.prettier
  },
})

