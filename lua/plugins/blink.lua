return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"echasnovski/mini.nvim",
			"Exafunction/codeium.nvim",
			"rafamadriz/friendly-snippets",
		},
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = {
				preset = "default",
				["<S-Tab>"] = {},
				["<Tab>"] = {},
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = { border = "single" },
				documentation = {
					window = { border = "single" },
				},
			},
			signature = {
				enabled = true,
				window = { border = "single" },
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer", "codeium" },
				providers = {
					codeium = {
						name = "Codeium",
						module = "codeium.blink",
						async = true,
						enabled = function()
							if vim.bo.filetype == "minifiles" then
								return false
							end
							if vim.bo.filetype == "minipick" then
								return false
							end
							if vim.bo.filetype == "" then
								return false
							end
							if vim.bo.filetype == nil then
								return false
							end
							return true
						end,
					},
					lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
			snippets = { preset = "mini_snippets" },
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
