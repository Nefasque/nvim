local M = {}

--- comprueba si el diretorio actual es un repositorio de git
M.is_repo_git = function ()
  local handle = io.popen('git rev-parse --is-inside-work-tree 2>/dev/null')
  local result = handle:read("*a")
  handle:close()

  return result:match('true') ~= nil
end

M.is_image = function(filepath)
  local image_extensions = { 'png', 'jpg' }
  local split_path = vim.split(filepath:lower(), '.', { plain = true })
  local extension = split_path[#split_path]
  return vim.tbl_contains(image_extensions, extension)
end

M.is_Markdown = function(filepath)
  local image_extensions = { 'md', 'MD' }
  local split_path = vim.split(filepath:lower(), '.', { plain = true })
  local extension = split_path[#split_path]
  return vim.tbl_contains(image_extensions, extension)
end


return M
