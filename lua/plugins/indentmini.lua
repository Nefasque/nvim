return {
  'nvimdev/indentmini.nvim',
  event = 'VeryLazy',
  opts = {
    char = "",
    exclude = {
      "erlang",
      "markdown",
    },

    vim.cmd.highlight("default link IndentLine color12")
  }
}
