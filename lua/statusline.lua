-- ==================
-- Statusline Modules
-- ==================
local hl = require("utils").hl
hl("stlhl_mode", { link = "blockred" })
hl("stlhl_path", { fg = "NONE", bg = "NONE" })

local M = {}

M.mode = function()
	local mode = vim.fn.mode()
	if mode == "n" or mode == "no" then
		hl("stlhl_mode", { link = "blockred" })
		return "  "
	elseif mode == "i" or mode == "ic" or mode == "r" then
		hl("stlhl_mode", { link = "blockyellow" })
		return " 󰏫 "
	elseif mode == "v" or mode == "V" then
		hl("stlhl_mode", { link = "blockblue" })
		return "  "
	elseif mode == "" then
		hl("stlhl_mode", { link = "blockblue" })
		return "  "
	elseif mode == "s" or mode == "S" or mode == "" then
		hl("stlhl_mode", { link = "blockblue" })
		return "  "
	elseif mode == "c" then
		hl("stlhl_mode", { link = "blockorange" })
		return "  "
	elseif mode == "R" or mode == "Rv" then
		hl("stlhl_mode", { link = "blockpurple" })
		return "  "
	elseif mode == "r?" then
		hl("stlhl_mode", { link = "blockgreen" })
		return "  "
	elseif mode == "!" then
		hl("stlhl_mode", { link = "blockpurple" })
		return "  "
	elseif mode == "t" then
		hl("stlhl_mode", { link = "blockorange" })
		return "  "
	else
		return mode
	end
end

M.cursorPos = function()
	local l = vim.fn.getcurpos()[2]
	local c = vim.fn.getcurpos()[3]

	local llen = vim.fn.len(l)
	if llen == 1 then
		l = "   " .. l
	elseif llen == 2 then
		l = "  " .. l
	elseif llen == 3 then
		l = " " .. l
	end

	local clen = vim.fn.len(c)
	if clen == 1 then
		c = c .. "   "
	elseif clen == 2 then
		c = c .. "  "
	elseif clen == 3 then
		c = c .. " "
	end

	return l .. ":" .. c
end

M.fileInfo = function()
	local filetype = vim.bo.filetype
	local patch = vim.fn.expand("%:f")
	local name = vim.fn.expand("%:t")
	local ext = vim.fn.expand("%:e")
	local icon, color = require("nvim-web-devicons").get_icon_color(name, ext)

	if filetype == "ministarter" then
		return " "
	end

	if vim.bo.buftype == "terminal" then
		hl("stlhl_path", { fg = color })
		return " "
	end

	if filetype == "help" then
		hl("stlhl_path", { fg = color })
		return "   NEOVIM DOCUMENTATION - " .. name .. " - "
	end

	if icon == nil then
		return " " .. patch
	end

	hl("stlhl_path", { fg = color })
	return " " .. icon .. " " .. patch
end

return M

-- vim.cmd[[
-- 	set statusline+=%#stlhl_mode#
-- 	set statusline+=\
-- 	set statusline+=%{stlfn.mode()}
-- 	set statusline+=\
-- 	set statusline+=%#stlhl_path#
-- 	set statusline+=%{stlfn.ft()}
-- 	set statusline+=%m
-- 	set statusline+=%=
-- 	set statusline+=%#green#
-- 	set statusline+=\
-- 	set statusline+=%#blue#
-- 	set statusline+=%{stlfn.cp()}
-- 	set statusline+=%{stlfn.si()}
-- ]]

-- vim.go.statusline =
-- "%{%(nvim_get_current_win()==#g:actual_curwin || &laststatus==3) ? 'nahhola' : 'work' %}"
