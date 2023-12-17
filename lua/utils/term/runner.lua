local opt = ""

-- run current file --
vim.keymap.set("n", "<leader>rr", function()
	local file = vim.fn.expand("%:.")
	local run = "/home/nefasque/.config/nvim/lua/utils/script/runner.sh"
	vim.cmd(":TermExec cmd='" .. run .. " " .. file .. " " .. opt .. "'")
end, { noremap = true })

vim.keymap.set("n", "<leader>ro", function()
	opt = vim.fn.input("Opt: ")
end, { noremap = true })
