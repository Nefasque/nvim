require("config")

-- elescope
vim.api.nvim_create_user_command("TestT", function()
	local picker = require("telescope.pickers")
	local finders = require("telescope.finders")
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local conf = require("telescope.config").values

	picker
		.new({}, {
			prompt_title = "Alpha",
			finder = finders.new_table({
				results = vim.fn.readfile(vim.g.historial_run_save_path),
			}),
			sorter = conf.generic_sorter(),
			previewer = false,
			attach_mappings = function(_, map)
				map("i", "<cr>", function(promt_bufnr)
					actions.close(promt_bufnr)
					local entry = action_state.get_selected_entry()
					vim.notify(entry[1])
				end)
				return true
			end,
		})
		:find()
end, {})
