local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  ui = {
    size = { width = 0.7, height = 0.7 },
    border = 'single',
    title = " Packeg manager Plugins ",
    title_pos = "left",
    pills = true,
  },
	spec = {
		{ import = "plugins" },
	},
}, {})
