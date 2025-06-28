---@type vim.lsp.config
return {
	cmd = { "some-sass-language-server", "--stdio" },
	filetypes = { "sass", "scss" },
	name = "somesass_ls",
 	root_markers = { ".git", ".package.json" },
  somesass = {
    suggestAllFromOpenDocument = true
  }
}
