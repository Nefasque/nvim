-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd -- execute Vim commands
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options
local ag = vim.api.nvim_create_augroup -- create autogroup
local au = vim.api.nvim_create_autocmd -- create autocomand

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " " -- change leader
g.maplocalleader = "," -- change maplocalleader
opt.mouse = "a" -- enable mouse support
opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile

vim.opt.fileformats = { "unix", "mac", "dos" } -- Support multiple file formats

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- show line number
opt.numberwidth = 3
opt.relativenumber = true -- show line number
opt.showmatch = true -- highlight matching parenthesis
opt.colorcolumn = "80" -- line lenght marker at 80 columns
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.linebreak = true -- wrap on word boundary
opt.winborder = "none" -- borde for window popus
opt.conceallevel = 0
opt.termguicolors = true
opt.guifont = "FiraCode Nerd Font"
opt.scrolloff = 999

vim.o.cursorline = true
vim.o.number = true
vim.o.termguicolors = true
vim.o.signcolumn='auto'

-- opt.singncolumn="auto" │
opt.statuscolumn="%T%@NumCb@%l%=%@SignCb@%s" -- Satuscolumn separator

vim.cmd([[let &t_Cs = "\e[4:3m"]]) -- Undercurl
vim.cmd([[let &t_Ce = "\e[4:0m"]]) -- Undercurl

-----------------------------------------------------------
-- Folding
-----------------------------------------------------------
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldcolumn = '1'
vim.o.foldlevelstart = 99
vim.o.foldenable = true
opt.list = true
opt.listchars = "tab:  ,space: ,nbsp:␣,trail:•,precedes:«,extends:»"

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 1000 -- max column for syntax highlight
opt.undofile = true

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = false -- use spaces instead of tabs
opt.shiftwidth = 2 -- shift 4 spaces when tab
opt.tabstop = 2 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

----------------------------------------------------------
--- sessions
----------------------------------------------------------
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "winpos", "help", "options", "terminal" }

----------------------------------------------------------
-- diagnostic config
----------------------------------------------------------
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	signs = false,
	float = true,
	update_in_insert = true,
	severity_sort = true,
	underline = true,
})

-- remove line lenght marker for selected filetypes
cmd([[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]])

au("BufEnter", {
	pattern = "markdown",
	callback = function()
		vim.g.indentLine_enabled = 0
	end,
})

-----------------------------------------------------------
-- Spell
-----------------------------------------------------------
-- enable spanish spell on markdown only
local markdown_spell = ag("markdownSpell", {})
au("FileType", {
	pattern = "markdown",
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
