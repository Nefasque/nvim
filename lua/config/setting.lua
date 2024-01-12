----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
--local exec = vim.api.nvim_exec         -- execute Vimscript
--local fn = vim.fn                      -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
--local api = vim.api                    -- call Vim api
local ag = vim.api.nvim_create_augroup -- create autogroup
local au = vim.api.nvim_create_autocmd -- create autocomand

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " " -- change leader to a comma
opt.mouse = "" -- enable mouse support
opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile
opt.backup = false
opt.errorbells = true
g.himalaya_mailbox_picker = "native"
opt.spelllang = "es"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- show line number
opt.relativenumber = true -- show line number
opt.numberwidth = 1 -- line number width
opt.showmatch = true -- highlight matching parenthesis
opt.foldmethod = "expr" -- enable folding (default 'foldmarker')
opt.colorcolumn = "100" -- line lenght marker at 80 columns
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters n search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.linebreak = true -- wrap on word boundar
opt.foldlevel = 99 -- should open all folds
opt.conceallevel = 0
opt.termguicolors = true -- colors term with true color
opt.laststatus = 3
opt.showmode = false -- don't show mode
opt.cursorline = true -- cursor line

opt.signcolumn = "no"
opt.timeoutlen = 400

opt.showtabline = 0 -- disable tabline

-----------------------------------------------------------
-- Folding
-----------------------------------------------------------
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.list = true
opt.listchars = "tab:▸ ,space: ,nbsp:␣,trail:•,precedes:«,extends:»"

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = false -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 1000 -- max column for syntax highlight
opt.undofile = true -- file undo history

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2 -- shift 2 spaces when tab
opt.tabstop = 2 -- 1 tab == 2 spaces
opt.smartindent = true -- autoindent new lines
opt.softtabstop = 2
opt.ruler = false

-- remove line lenght marker for selected filetypes
cmd([[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]])

opt.syntax = "on"

-----------------------------------------------------------
-- Spell
-----------------------------------------------------------
-- enable spanish spell on markdown only
local markdown_spell = ag("markdownSpell", {})
au("FileType", {
	pattern = "markdown,html",
	callback = function()
		vim.opt.spelllang = "es"
		vim.opt.spell = true
	end,
	group = markdown_spell,
})
au({ "BufRead", "BufNewFile" }, {
	pattern = "*.md",
	callback = function()
		vim.opt.spelllang = "es"
		vim.opt.spell = true
	end,
	group = markdown_spell,
})
