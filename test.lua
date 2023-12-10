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

local frase1 = "hola"
local frase2 = "mundo"

print(frase1 .. " " .. frase2)

frase1 = frase1 .. frase2

print(frase1)
