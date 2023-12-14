local toggletemp = require("toggleterm")

toggletemp.setup({
	open_mapping = [[<c-\>]],
	direction = "float",
	hide_numbers = true,
	autochdir = true,
	start_in_insert = true,
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
		run = "cmd='%:p'"
	end

	if fileType == "lua" then
		run = "cmd='lua %:p'"
	end

	if fileType == "javascript" then
		run = "cmd='node %:p'"
	end

	vim.cmd(cmd .. " " .. run .. " <CR>")
end, { noremap = true, silent = true, desc = "Run current file" })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	vim.keymap.set("t", "<C-x>", [[<C-\><C-n> :ToggleTermToggleAll<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
