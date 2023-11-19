vim.g.mapleader = " "

local opt = vim.o

-- number 
opt.number = true
opt.relativenumber = true
opt.numberwidth = 1

opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

--opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false


opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.backup = false
opt.swapfile = false
opt.errorbells = false

opt.syntax = "on"


-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
-- opt.whichwrap:append "<>[]hl"

-- leader

-- fols
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd([[ autocmd BufReadPost,FileReadPost * normal zR ]])

local function CustomFoldText()
  local foldstart = vim.fn.foldclosed(vim.fn.line('.'))
  local foldend = vim.fn.foldclosedend(vim.fn.line('.'))
  local indentation = vim.fn.indent(foldstart - 1)
  local foldSize = 1 + foldend - foldstart
  local foldSizeStr = " " .. foldSize .. " lines "
  local foldLevelStr = string.rep("+--", vim.wo.foldlevel)
  local expansionString = string.rep(" ", indentation)

  return expansionString .. foldLevelStr .. foldSizeStr
end

vim.foldtext=CustomFoldText()
