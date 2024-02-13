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
M.get_xresources_color = function(c)
	local command = io.popen("xrdb -query | grep " .. c .. " -m 1 | cut -f 2")
	if command == nil then
		return "#ff00ff"
	end

	local color = command:read("*l")
	return color
end

return M
