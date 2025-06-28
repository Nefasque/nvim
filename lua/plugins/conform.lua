local formatters = {
	lua = { "stylua", lsp_format = "fallback" },
	json = { "jq" },
	html = { "prettier" },
	javascritp = { "prettier" },
	css = { 'prettier' },
	scss = { 'prettier' },
	bash = { "beautysh" },
	python = { "black" },
}

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = formatters,
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	keys = {
		{
			"<leader>vf",
			function()
				require("conform").format({ lsp_format = "fallback" })
			end,
			desc = "Format with Conform",
		},
	},
}
