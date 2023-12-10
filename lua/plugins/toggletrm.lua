return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	opts = {
		open_mapping = [[<c-\>]],
		insert_mappings = true,
		term_mappings = false,
		border = "curved",
	},

	keys = {
		{
			"<leader>c",
			":ToggleTerm direction=float<cr>",
			desc = "ToggleTerm float",
		},
		{
			"<leader>ch",
			":ToggleTerm direction=horizontal<cr>",
			desc = "ToggleTerm horizontal split",
		},
		{
			"<leader>cv",
			":ToggleTerm direction=vertical<cr>",
			desc = "ToggleTerm vertical split",
		},
		{
			"<leader>ct",
			":ToggleTerm direction=tab<cr>",
			desc = "ToggleTerm buffer",
		},
	},
}
