return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "single",
				backdrop = 100,
			},
		})

		local ensure_installed = {}
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
			"prettier", -- Used to format JavaScript code
			"jq", -- Used to format JSON code
			"black", -- Used to format Python code
			"beautysh" -- Used to format shell scripts
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				-- "emmet_ls",
				"pylsp",
				"bashls",
				"cssls",
				"emmet_language_server",
			},
		})
	end,
}
