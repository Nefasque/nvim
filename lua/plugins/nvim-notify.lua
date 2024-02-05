---@diagnostic disable:missing-fields

return {
	"rcarriga/nvim-notify",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",

	config = function()
		local notify = require("notify")
		-- this for transparency
		notify.setup({
			background_colour = "#000000",
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      stage = "static",
      render = "wrapped-compact",
      top_down = true,
      animate = false,
		})
		-- this overwrites the vim notify function
		vim.notify = notify.notify
	end,
}

