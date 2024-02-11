return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
	keys = {
		{
			"-",
			"<CMD>Oil --float<CR>",
			desc = "Open parent directory",
		},
	},
	config = function()
		local oil = require("oil")
		oil.setup({
			keymaps = {
				["cd"] = "actions.cd",
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = true,
				foldcolumn = "0",
				spell = false,
				list = true,
				conceallevel = 2,
				concealcursor = "nvic",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					if name == ".." or name == ".git" then
						return true
					end
					return false
				end,
				sort = {
					-- sort order can be "asc" or "desc"
					-- see :help oil-columns to see which columns are sortable
					{ "type", "asc" },
					{ "name", "asc" },
					{ "mtime", "asc" },
				},
			},
			float = {
				max_width = 80,
				max_height = 20,
				padding = 0,
			},
		})
	end,
}
