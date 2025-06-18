---------------------
-- Execute quickly --
---------------------
---
--- script for execute quickly file of scriting,
--- (bash, pthon, lua, sh, c, cpp, go, rs, php, pl, rb, ts)
--- ---
--- dependencies:
--- plin: https://github.com/akinsho/toggleterm.nvim
local custom_commands = {}
local message = {
	no_permiso_exection = "Sorry, but this file does not have permissions of execution",
	no_support = "Sorry, but this file can not run",
}

local make_cmd = function(file)
	local ext = file:match("%.(.*)")
	if ext == "js" then
		return "node " .. file
	elseif ext == "py" then
		return "python " .. file
	elseif ext == "lua" then
		return "lua " .. file
	elseif ext == "sh" then
		return "sh " .. file
	elseif ext == "c" then
		local name = file:match("(.+)%..+")
		return "gcc " .. file .. " -o " .. name .. " && " .. name
	elseif ext == "cpp" then
		local name = file:match("(.+)%..+")
		return "g++ " .. file .. " -o " .. name .. " && " .. name
	elseif ext == "go" then
		return "go run " .. file
	elseif ext == "rs" then
		return "cargo run" .. file
	elseif ext == "php" then
		return "php " .. file
	elseif ext == "pl" then
		return "perl " .. file
	elseif ext == "rb" then
		return "ruby " .. file
	elseif ext == "ts" then
		return "ts-node " .. file
	elseif ext == nil then
		if vim.fn.system("ls -local " .. file .. " | awk '{print $1}' | grep 'x'") ~= "" then
			return file
		else
			return "no_permiso_exection"
		end
	end
	-- check if file have permission of execution
	-- return nil
	return "no_support"
end

local runner = function()
	local file = vim.fn.expand("%:.")
	if file == "" then
		vim.notify("Not running because current file is not selected", vim.log.levels.WARN)
		return
	end

	local cmd = vim.tbl_get(custom_commands, file)

	if not cmd then
		cmd = make_cmd(file)
	end

	if vim.tbl_get(message, cmd) ~= nil then
		cmd = vim.tbl_get(message, cmd)
		-- vim.notify(cmd)
		vim.cmd(":TermExec cmd='clear; \"" .. cmd .. "\" -n -f tux | lolcat;'")
		return
	end

	vim.cmd(":TermExec cmd='clear; " .. cmd .. ";  '")
end

-- run current file --
vim.keymap.set("n", "<leader>rr", function()
	runner()
end, { noremap = true })

-- modificar comando --
vim.keymap.set("n", "<leader>ro", function()
	local file = vim.fn.expand("%:.")
	local cmd = vim.tbl_get(custom_commands, file)
	if not cmd then
		cmd = make_cmd(file)
	end
	vim.ui.input({ prompt = "cmd: ", default = cmd, completion = "shellcmd" }, function(input)
		local temp = { [file] = input }
		custom_commands = vim.tbl_deep_extend("force", custom_commands, temp)
	end)
end, { noremap = true })
