
local M = {}

--- comprueba si el diretorio actual es un repositorio de git
M.is_repo_git = function ()
  local handle = io.popen('git rev-parse --is-inside-work-tree 2>/dev/null')
  local result = handle:read("*a")
  handle:close()

  return result:match('true') ~= nil
end

return M
