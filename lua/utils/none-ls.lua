local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		-- formant
		formatting.autopep8,
		formatting.shellharden,
		formatting.stylua.with({ filetypes = { "lua" } }),
		formatting.prettier.with({
			filetypes = { "html", "markdown", "css", "js", "javascript" },
		}),
	},
})
