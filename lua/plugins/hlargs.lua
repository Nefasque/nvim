local colorscheme = require("utils").get_colorscheme()

return {
    'm-demare/hlargs.nvim',
	dependencies = {'nvim-treesitter/nvim-treesitter'},
	opts = {
		use_colorpalette = true,
		hl_priority = 9999,
		sequential_colopalette = true,
		colorpalette = {
			{fg = colorscheme['colorRed']},
			{fg = colorscheme['colorGreen']},
			{fg = colorscheme['colorYellow']},
			{fg = colorscheme['colorBlue']},
			{fg = colorscheme['colorPurple']},
		}
	}
}
