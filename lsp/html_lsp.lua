---@type vim.lsp.config
return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "javascript" },
  --configurationSection = { "html", "css", "javascript" },
  embeddedLanguages = {
    css = true,
    javascript = true
  },
  provideFormatter = true,
  root_markers = {
    ".git",
  },
}
