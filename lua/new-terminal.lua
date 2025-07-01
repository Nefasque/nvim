local Terminal = require("toggleterm.terminal").Terminal

local cmd = {
	-- { name, cmd, number term}
	{ "liver-server", "liver-server" },
	{ "sass", "sass --watch scss/style.scss:css/style.css" },
	{ "sl", "sl -a" },
	{ "neofetch", "neofetch" },
	{ "htop", "htop" },
	{ "cmatrix", "cmatrix -a -s" },
}

local names_cmd = function()
	local t = {}
	for _, v in pairs(cmd) do
		table.insert(t, v[1])
	end
	return t
end

local terms = {}
for i, v in pairs(cmd) do
	terms[v[1]] = Terminal:new({
		cmd = v[2],
		hidden = false,
		count = 320 + i,
		display_name = v[1],
		close_on_exit = false,
	})
end

vim.keymap.set("n", "tr", function()
	vim.ui.select(names_cmd(), { prompt = "Select target" }, function(choice)
		if choice == nil then
			return
		end
		terms[choice]:toggle()
	end)
end, { desc = "Run Terminal" })

vim.keymap.set("n", "tn", "<cmd>TermSelect<cr>", { desc = "Select Terminal" })
