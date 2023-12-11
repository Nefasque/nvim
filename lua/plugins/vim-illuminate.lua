return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- highlights config IlluminatedWordWrite
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3f3f3f" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3f3f3f" })
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3f3f3f" })
		require("illuminate").configure({
			under_cursor = true,
			max_file_lines = nil,
			delay = 100,
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			filetypes_denylist = {
				"NvimTree",
				"Trouble",
				"Outline",
				"TelescopePrompt",
				"Empty",
				"dirvish",
				"fugitive",
				"alpha",
				"packer",
				"neogitstatus",
				"spectre_panel",
				"toggleterm",
				"DressingSelect",
				"aerial",
			},
		})
	end,
}
