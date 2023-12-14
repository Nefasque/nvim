require("config.setting")
require("config.lazy")
require("config.keymaps")

require("utils")

-- vim.api.nvim_exec ([[
--     augroup markdownSpell
--         autocmd!
--         autocmd FileType markdown setlocal spell spelllang=es
--         autocmd BufRead,BufNewFile *.md setlocal spell spelllang=es
--     augroup END
-- ]], false)
