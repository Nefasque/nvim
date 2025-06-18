return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 20
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		shade_terminals = false,
		start_in_insert = false,
		float_opts = {
			border = "single",
		},
	},
	keys = {
		{
			"<leader>tf",
			":ToggleTerm direction=float<cr>",
			desc = "ToggleTerm float",
		},
		{
			"<leader>ts",
			":ToggleTerm direction=horizontal<cr>",
			desc = "ToggleTerm horizontal split",
		},
		{
			"<leader>tv",
			":ToggleTerm direction=vertical<cr>",
			desc = "ToggleTerm vertical split",
		},
		{
			"<leader>tt",
			":ToggleTerm direction=tab<cr>",
			desc = "ToggleTerm buffer",
		},
	},
}
