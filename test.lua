-- test api of neovim

--local expand = vim.fn.expand

-- vim.o -> get option
-- exaplen
--  print(vim.o.nu)
--  print(vim.o.path)

-- vim.go -> get global option
-- vim.bo -> get buffer option
-- vim.wo -> get window option
-- vim.opt -> get option
--

-- local math = require("math")

local list = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }

local index = math.random(1, 10)

print(list[index])
