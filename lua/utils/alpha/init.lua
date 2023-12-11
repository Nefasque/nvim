local alpha = require("alpha")
local startify = require("alpha.themes.startify")

startify.config.opts = {
	noautocmd = false,
	margin = 2,
}

vim.cmd(
	[[autocmd User AlphaReady lua require("alpha.themes.startify").section.header.val = require("utils.alpha.headers")]]
)
startify.section.header.val = require("utils.alpha.headers")

startify.section.top_buttons.val = {
	startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	startify.button("f", "  Seach File", ":Telescope find_files<CR>"),
	startify.button("r", "  Recent File", ":Telescope oldfiles<CR>"),
	startify.button("t", "  Terminal", ":ToggleTerm<CR>"),
	startify.button("u", "  Plugins", ":Lazy<CR>"),
	startify.button("s", "  Settings", ":e ~/.config/nvim/lua/config/setting.lua<CR>"),
	startify.button("h", "󰞋  Help", ":Telescope help_tags<CR>"),
	startify.button("a", "x  Cancel", ":Alpha<CR>"),
}

startify.section.bottom_buttons.val = {
	startify.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- disable MRU
startify.section.mru.val = { { type = "padding", val = 0 } }
-- disable MRU cwd
--startify.section.mru_cwd.val = { { type = "padding", val = 0 } }

alpha.setup(startify.config)
