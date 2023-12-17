-- navegation in mode insert
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "move left" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "move up" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })

-- go to beginning and end line in mone insert mode
vim.keymap.set("i", "<C-b>", "<ESC>I", { desc = "move beginning" })
vim.keymap.set("i", "<C-e>", "<ESC>A", { desc = "move end" })

-- buffer actions
vim.keymap.set("n", "<leader>q", ":bd!<cr>", { desc = "Close current buffer" })
-- new buffer
vim.keymap.set("n", "<C-n>", ":enew<cr>", { desc = "New buffer" })
-- got a to next buffer
vim.keymap.set("n", "<leader>z", ":bn<cr>", { desc = "Next buffer" })
-- got a to prev buffer
vim.keymap.set("n", "<leader>x", ":bp<cr>", { desc = "Prev buffer" })

-- relaod config neovim
vim.keymap.set("", "<F6>", ":source ~/.config/nvim/init.lua<cr>", { desc = "Source the current file" })

vim.keymap.set("v", ">", ">gv", { desc = "after tab in re-select the same" })
vim.keymap.set("v", "<", "<gv", { desc = "after tab out re-select the same" })

-- search
vim.keymap.set("n", "n", "nzzzv", { desc = "Goes to the next result on the seach and put the cursor in the middle" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Goes to the prev result on the seach and put the cursor in the middle" })

-- clear highlight
vim.keymap.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear highlight" })

-- split window
vim.keymap.set("n", "<leader>h", ":split<cr>", { desc = "Split window" })
vim.keymap.set("n", "<leader>v", ":vsplit<cr>", { desc = "Split window vertical" })

-- switch bentween window
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Switch to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Switch to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Switch to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Switch to right window" })

-- togglet number
vim.keymap.set("n", "<leader><leader>n", ":set nu! rnu!<cr>", { desc = "Toggle line number" })

-- copy all current file
vim.keymap.set("n", "<leader><leader>a", ":%y+<cr>", { desc = "Copy all current file" })

-- save and quit
vim.keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>Q", ":q<cr>", { desc = "Quit file" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
vim.keymap.set({ "n", "x", "v" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true, silent = true })
vim.keymap.set({ "n", "x", "v" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true, silent = true })

-- scape of mode terminal
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Don't copy the replaced text after pasting in visual mode
vim.keymap.set("v", "p", '"_dP', { desc = "Don't copy the replaced text after pasting in visual mode" })

-- load source config %
vim.keymap.set("n", "<F7>", ":source %<cr>", { desc = "Reload config" })

-- toggle spell
vim.keymap.set("n", "<leader><leader>s", ":set spell!<cr>", { desc = "Toggle spell" })

-- alpha
vim.keymap.set("n", "<leader>a", ":Alpha<cr>", { desc = "Alpha" })

-- redimencinar paneles
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equal window" })
vim.keymap.set("n", "<leader>-", "<C-w>5-", { desc = "Equal window" })
vim.keymap.set("n", "<leader>+", "<C-w>5+", { desc = "Equal window" })
vim.keymap.set("n", "<leader><", "<C-w>5<", { desc = "Equal window" })
vim.keymap.set("n", "<leader>>", "<C-w>5>", { desc = "Equal window" })
