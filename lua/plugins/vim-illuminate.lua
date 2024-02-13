return {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- highlights config IlluminatedWordWrite
    local get_Xresouce = require("utils.functions").get_xresources_color

    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = 'none', bg = get_Xresouce('gray3')})
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = 'IlluminatedWordRead'})
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = 'IlluminatedWordRead'})


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
