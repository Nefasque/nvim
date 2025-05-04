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

-- undercurls support
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
