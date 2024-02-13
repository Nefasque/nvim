return {
	"sontungexpt/sttusline",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufEnter" },
	opts = {
		-- statusline_color = "#000000",
		statusline_color = "StatusLine",
		-- | 1 | 2 | 3
		-- recommended: 3
		laststatus = 3,
		disabled = {
			filetypes = {
				"NvimTree",
				"lazy",
				"mason",
				"telescope",
				"alpha",
			},
			buftypes = {
				"terminal",
			},
		},
		components = {
			"mode",
			"git-branch",
			"filename",
			"git-diff",
			"%=",
			"pos-cursor",
			-- "pos-cursor-progress",
			--"diagnostics",
			"lsps-formatters",
			-- "copilot",
			--"indent",
			--"encoding",
		},
	},
	config = function(_, opts)
		require("sttusline").setup(opts)

		--chagen highlight
		vim.cmd([[
      highlight! link STTUSLINE_COMPONENT_1_1 Grenn
      highlight! link STTUSLINE_COMPONENT_4_1 Grenn
      highlight! link STTUSLINE_COMPONENT_4_2 Blue
      highlight! link STTUSLINE_COMPONENT_4_3 Red
      highlight! link STTUSLINE_COMPONENT_2 Purple
      highlight! link STTUSLINE_COMPONENT_3 Purple
      highlight! link STTUSLINE_COMPONENT_7 Purple
      highlight! link STTUSLINE_COMPONENT_3_1 Comment
      highlight! link STTUSLINE_COMPONENT_3_2 Orange
    ]])
	end,
}
