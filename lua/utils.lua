local M = {}

--- check if the current directory is a git repo
M.is_repo_git = function()
	local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
	if not handle then
		return
	end
	local result = handle:read("*a")
	handle:close()

	return result:match("true") ~= nil
end

-- check if the file is an image  arg="path/to/file.png"
M.is_image = function(filepath)
	local image_extensions = { "png", "jpg" }
	local split_path = vim.split(filepath:lower(), ".", { plain = true })
	local extension = split_path[#split_path]
	return vim.tbl_contains(image_extensions, extension)
end

-- check if the file is a markdown  arg="path/to/file.md"
M.is_Markdown = function(filepath)
	local image_extensions = { "md", "MD" }
	local split_path = vim.split(filepath:lower(), ".", { plain = true })
	local extension = split_path[#split_path]
	return vim.tbl_contains(image_extensions, extension)
end

-- get the value of xresources
M.get_xresources_value = function(c)
	local command = io.popen("xrdb -query | grep " .. c .. " -m 1 | cut -f 2")
	if command == nil then
		return " "
	end
	local value = command:read("*l")
	return value
end

-- get colorsheme
M.get_colorscheme = function()
	local xresources_colors = io.popen("xrdb -query | grep -E 'color*|gray*'"):read("*a")
	local lua_colors = {}
	for _, line in ipairs(vim.fn.split(xresources_colors, "\n")) do
		local key, value = line:match("%*.(%w+):%s*(%S+)$")
		if key and value then
			lua_colors[key] = value
		end
	end
	return lua_colors
end

-- set keymap (Simplify syntax)
M.set_keymap = function(mode, shortcut, command, description, o)
	local d = { -- defualt valores
		silent = true,
		noremap = true,
		nowait = true,
		expr = false,
	}
	if o == nil then
		o = d
	else
		if o.silent == nil then
			o.silent = d.silent
		end
		if o.noremap == nil then
			o.noremap = d.noremap
		end
		if o.nowait == nil then
			o.nowait = d.nowait
		end
		if o.expr == nil then
			o.expr = d.expr
		end
	end

	vim.keymap.set(
		mode,
		shortcut,
		command,
		{ desc = description, silent = o.silent, noremap = o.noremap, nowait = o.nowait, expr = o.expr }
	)
end

-- Check if an element exists in the table
M.findvar = function(a, b)
	for _, valor in ipairs(b) do
		if valor == a then
			return true
		end
	end
	return false
end

-- simplification of the vim.api.nvim_set_hl()
M.hl = function(group, opts)
	opts = opts or {}
	vim.api.nvim_set_hl(0, group, opts)
end

return M
