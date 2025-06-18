local keymap = require("utils").set_keymap

-- utils
keymap("i", "ññ", "<Esc>", "exit mode insert")
keymap("n", "<esc>", "<cmd>nohl<cr>", "Clear search higlighting")
keymap("v", "p", '"_dP', "Don't copy the replaced text after pasting in visual mode")
keymap("n", "<F6>", ":source %<cr>", "Source the current file")

-- copy
keymap("n", "<leader><leader>a", ":%y+<cr>", "Copy all current file")
keymap(
	"n",
	"<leader>cpf",
	':let @+ = expand("%:p")<cr>:lua print("Copied path to: " .. vim.fn.expand("%:p"))<cr>',
	"Copy current file name and path"
)

-- save and quit
keymap("n", "<leader>w", ":w<cr>", "Save file")
keymap("n", "<leader>q", ":q<cr>", "Quit file")
keymap("n", "<leader>Q", ":q!<cr>", "Forced Quit file")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
keymap({ "n", "x", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "up", { expr = true, silent = true })
keymap({ "n", "x", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "down", { expr = true, silent = true })

-- navegation in mode insert
keymap("i", "<C-e>", "<ESC>I", "move beginning")
keymap("i", "<C-a>", "<ESC>A", "move end")

keymap("i", "<TAB>", "<C-t>", "tab -> ")
keymap("i", "<S-TAB>", "<C-d>", "tab <- ")

-- Visual mode manipulation
keymap("v", ">", ">gv", "after tab in re-select the same")
keymap("v", "<", "<gv", "after tab out re-select the same")
keymap("v", "<S-k>", ":m '<-2<CR>gv=gv", "Move Line Up in Visual Mode")
keymap("v", "<S-j>", ":m '>+1<CR>gv=gv", "Move Line Down in Visual Mode")

-- Searching and replacement
keymap("n", "n", '<cmd>execute "normal! nzzzv"<CR>', "Goes to the next result")
keymap("n", "N", '<cmd>execute "normal! Nzzzv"<CR>', "Goes to the prev result")

-- ""

keymap(
	"n",
	"<leader>re",
	":s/<C-r><C-w>//gc<Left><Left><Left>",
	"replaces the word throughout the line",
	{ silent = false }
)
keymap(
	"n",
	"<leader><leader>re",
	":%s/<C-r><C-w>//gc<Left><Left><Left>",
	"replaces the word throughout the file",
	{ silent = false }
)
keymap("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>', "replaces selection", { silent = false })

-- scroll - (center)
keymap("n", "<C-u>", '<cmd> execute "normal!\\<C-u> zvzz"<CR>', "scroll down")
keymap("n", "<C-d>", '<cmd> execute "normal!\\<C-d> zvzz"<CR>', "scroll up")

-- buffers handling
keymap("n", "<A-0>", "<cmd>buffer 0<cr>", "Buffer 0")
keymap("n", "<A-1>", "<cmd>buffer 1<cr>", "Buffer 1")
keymap("n", "<A-2>", "<cmd>buffer 2<cr>", "Buffer 2")
keymap("n", "<A-3>", "<cmd>buffer 3<cr>", "Buffer 3")
keymap("n", "<A-4>", "<cmd>buffer 4<cr>", "Buffer 4")
keymap("n", "<A-5>", "<cmd>buffer 5<cr>", "Buffer 5")
keymap("n", "<A-6>", "<cmd>buffer 6<cr>", "Buffer 6")
keymap("n", "<A-7>", "<cmd>buffer 7<cr>", "Buffer 7")
keymap("n", "<A-8>", "<cmd>buffer 8<cr>", "Buffer 8")
keymap("n", "<A-9>", "<cmd>buffer 9<cr>", "Buffer 9")
keymap("n", "<A-p>", "<cmd>bn<cr>", "Previous Buffer")
keymap("n", "<A-n>", "<cmd>bp<cr>", "Next Buffer")
keymap("n", "<A-d>", "<cmd>lua MiniBufremove.delete()<cr>", "Close Buffer")
keymap("n", "<A-l>", "<cmd>buffers<cr>", "list Buffer")

--Marks
-- set a mark with 'm {char}'
keymap("n", "'", "g`", "go to Mark")
keymap("n", "<leader>ml", "<cmd>marks<cr>", "shows Marks")
keymap("n", "<leader>md", ":delmarks ")

-- Lazy
keymap("n", "<leader>l", "", "Options lazy")
keymap("n", "<leader>lc", "<cmd>Lazy check<cr>", "Check")
keymap("n", "<leader>lX", "<cmd>Lazy clean<cr>", "Clean")
keymap("n", "<leader>li", "<cmd>Lazy install<cr>", "Install")
keymap("n", "<leader>ls", "<cmd>Lazy sync<cr>", "Sync")
keymap("n", "<leader>lu", "<cmd>Lazy update<cr>", "Update")
keymap("n", "<leader>lr", "<cmd>Lazy restore<cr>", "Restore")
keymap("n", "<leader>ll", "<cmd>Lazy<cr>", "Lazy")

-- Mason 
keymap("n", "<leader>mm", "<cmd>Mason<cr>", "Mason")


-- Panels
keymap("n", "<leader>pe", "<C-w>=", "Make Splits Equal")
keymap("n", "<leader>pq", "<cmd>close<CR>", "Close Split")

-- switch bentween Panels
keymap("n", "<C-h>", "<C-w>h", "Switch to left Panels")
keymap("n", "<C-j>", "<C-w>j", "Switch to down Panels")
keymap("n", "<C-k>", "<C-w>k", "Switch to up Panels")
keymap("n", "<C-l>", "<C-w>l", "Switch to right Panels")

-- redimencinar paneles
keymap("n", "<leader>=", "<C-w>=", "Equal Panels")
keymap("n", "<leader>-", "<C-w>5-", "less Panels")
-- keymap("n", "<leader>_", "<C-w>_", "maximise Panels")
keymap("n", "<leader>+", "<C-w>5+", "more Panels")
keymap("n", "<leader><", "<C-w>5<", "expand Panels")
keymap("n", "<leader>>", "<C-w>5>", "collapse Panels")

-- Options
keymap("n", "<leader>o", "", "Options")
keymap("n", "<leader>ow", ":set wrap !<CR>", "Wrap")
keymap("n", "<leader>on", ":set number !<CR>", "line number")
keymap("n", "<leader>or", ":set relativenumber !<CR>", "Relative Number")
keymap("n", "<leader>ol", ":set cursorline !<CR>", "Cursorline")
keymap("n", "<leader>ot", ":set tabline !<CR> ", "Tabline")
keymap("n", "<leader><leader>s", ":set spell!<cr>", "Toggle spell")

-- terminal
keymap("t", "<C-w>", "<C-\\><C-n>", "Exit terminal mode")

-- diagnotic
keymap("n", "tS", function()
	local new_config = not vim.diagnostic.config().signs
	vim.diagnostic.config({ signs = new_config })
end, "Toggle diagnostic virtual_lines")

--- Mini.Pick (mini.extra)
keymap("n", "tb", "<cmd>Pick buffers<CR>", "Pick Buffers")
keymap("n", "tf", "<cmd>Pick files<CR>", "Pick Files")
keymap("n", "to", "<cmd>Pick oldfiles<CR>", "Pick Old Files")
keymap("n", "tx", "<cmd>Pick explorer<CR>", "Pick Explorer")
keymap("n", "th", "<cmd>Pick hl_groups<CR>", "Pick Highlight")
keymap("n", "tm", "<cmd>Pick marks<CR>", "Pick Marks")
keymap("n", "tt", "<cmd>Pick treesitter<CR>", "Pick Treesitter")
keymap("n", "tlD", "<cmd>Pick lsp scope='declaration'<CR>", "Pick LSP Declaration")
keymap("n", "tld", "<cmd>Pick lsp scope='definition'<CR>", "Pick LSP Definition")
keymap("n", "tlr", "<cmd>Pick lsp scope='references'<CR>", "Pick LSP References")
keymap("n", "tli", "<cmd>Pick lsp scope='implementation'<CR>", "Pick LSP Implementatio")
keymap("n", "tls", "<cmd>Pick lsp scope='document_symbol'<CR>", "Pick LSP Document Symbol")
keymap("n", "tlS", "<cmd>Pick lsp scope='workspace_symbol'<CR>", "Pick LSP Workspace Symbol")
keymap("n", "td", "<cmd>Pick diagnostic<CR>", "Pick Diagnostics")
keymap("n", "tgb", "<cmd>Pick git_branches<CR>", "Pick Git branches")
keymap("n", "tgc", "<cmd>Pick git_commits<CR>", "Pick Git commits")
keymap("n", "tgo", "<cmd>Pick git_files<CR>", "Pick Git files")
keymap("n", "tgh", "<cmd>Pick git_hunks<CR>", "Pick Git hunks")
keymap("n", "tz", "<cmd>Pick grep<CR>", "Pick grep")
keymap("n", "tZ", "<cmd>Pick grep_live<CR>", "Pick live gre")
keymap("n", "tc", "<cmd>Pick commands<CR>", "Pick Commands")
keymap("n", "tC", "<cmd>Pick history<CR>", "Pick History Command")
keymap("n", "tk", "<cmd>Pick keymaps<CR>", "Pick Keymaps")
keymap("n", "tpq", "<cmd>Pick list scope='quickfix'<CR>", "Pick Quickfix")
keymap("n", "tpo", "<cmd>Pick list scope='location-list'<CR>", "Pick Location-list")
keymap("n", "tq", "<cmd>Pick help<CR>", "Pick Help tags")
keymap("n", "ts", "<cmd>Pick spellsuggest<CR>", "Pick Spell Suggest")

--- mini.file
keymap("n", "te", "<cmd>lua MiniFiles.open()<CR>", "MiniFiles")

-- vimade focus  toggle
keymap("n", "<leader>F","<cmd>VimadeFocus<CR>", "VimadeFocus")

