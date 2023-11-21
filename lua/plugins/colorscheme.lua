return {
	"sainnhe/sonokai",
	lazy = false,
  priority = 1000,
	config = function()
    vim.g.sonokai_style = 'shusia'
    vim.g.sonokai_transparent_background = 1
    vim.g.sonokai_cursor = "red"

    vim.cmd([[colorscheme sonokai]])
  end
}
