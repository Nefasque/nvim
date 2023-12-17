return {
	"hrsh7th/nvim-cmp",

	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-git",
		"saadparwaiz1/cmp_luasnip",

		-- order
		"lukas-reineke/cmp-under-comparator",

		-- auto cerrado de pares
		"windwp/nvim-autopairs",

		-- icons
		"onsails/lspkind.nvim",
		{
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			-- enabled = false,
			config = function()
				require("codeium").setup({})
			end,
		},
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = { "rafamadriz/friendly-snippets" },
			main = "config.plugins.luasnip",
			config = true,
		},
	},
	main = "config.plugins.cmp",
	config = true,
}
