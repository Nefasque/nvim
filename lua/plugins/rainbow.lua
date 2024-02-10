return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		-- This module contains a number of default definitions
		local rainbow = require("rainbow-delimiters")

		---@type rainbow_delimiters.config
		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow.strategy["global"],
				vim = rainbow.strategy["local"],
				-- html = rainbow.strategy["global"],
				-- latex = function(bufnr)
				-- 	-- Disabled for very large files, global strategy for large files,
				-- 	-- local strategy otherwise
				-- 	local line_count = vim.api.nvim_buf_line_count(bufnr)
				-- 	if line_count > 10000 then
				-- 		return nil
				-- 	elseif line_count > 1000 then
				-- 		return rainbow.strategy["global"]
				-- 	end
				-- 	return rainbow.strategy["local"]
				-- end,
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-delimiters",
        -- html = "rainbow-delimiters",
			},
			priority = {
				[""] = 110,
				lua = 210,
			},
			highlight = {
				"Red",
				"Blue",
				"Green",
				"Purple",
				"Orange",
				"Yellow",
			},
		}
	end,
}
