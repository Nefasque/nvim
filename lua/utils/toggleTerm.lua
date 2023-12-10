local toggletemp = require("toggleterm")

toggletemp.setup({
	open_mapping = [[<c-\>]],
	on_open = function()
		print("Terminal open")
	end,
	bash = {
		cmd = "bash",
	},
	direction = "float",
	hide_numbers = false,
	autochdir = true,
	start_in_insert = true,
	persist_size = true,
	float_opts = {
		border = "rounded",
	},
})

-- run current file
vim.keymap.set("n", "<leader>rr", function()
	local fileType = vim.bo.filetype
	local cmd = "TermExec direction=float name='runner' "
	local run = ""

	if fileType == "python" then
		run = "cmd='python3 %:p'"
	end

	if fileType == "sh" then
		run = "cmd='bash %:p'"
	end

	if fileType == "lua" then
		run = "cmd='lua %:p'"
	end

	if fileType == "javascript" then
		run = "cmd='node %:p'"
	end

	vim.cmd(cmd .. " " .. run .. " <CR>")
end, { noremap = true, silent = true, desc = "Run current file" })

-- navigation terminal
local opts = { buffer = 0 }
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
