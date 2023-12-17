-- test api of neovim
--local expand = vim.fn.expand

-- vim.o -> get option
-- exaplen
-- print(vim.o.nu)
-- rint(vim.o.path)

-- vim.go -> get global option
-- vim.bo -> get buffer option
-- vim.wo -> get window option
-- vim.opt -> get option

-- print(vim.fn.expand("%:t"))

-- pedir dato al usuario
local input = vim.fn.input("Input: ")
print(input)
