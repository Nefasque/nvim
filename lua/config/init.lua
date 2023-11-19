require "config.setting"
require "config.lazy"

local utils = require "utils.init"

vim.keymap.set('n', '<space>e', utils.is_repo_git)

