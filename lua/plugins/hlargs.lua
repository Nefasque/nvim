return {
	"m-demare/hlargs.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		hl_priority = 200,
		use_colorpalette = true,
		sequential_colorpalette = true,
		colorpalette = {
			{ link = "colorYellow" },
			{ link = "colorPurple" },
			{ link = "colorOrange" },
			{ link = "colorGreen" },
			{ link = "colorBlue" },
			{ link = "colorRed" },
		},
	},
}
