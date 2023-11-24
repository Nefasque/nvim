return {
	"sainnhe/sonokai",
	lazy = false,
  priority = 1000,
	config = function()
    vim.g.sonokai_style = 'shusia'
    vim.g.sonokai_transparent_background = 2
    vim.g.sonokai_cursor = "red"
    vim.g.sonokai_show_eob = 0
    vim.g.sonokai_dim_inactive_windows = 1
    vim.g.sonokai_disable_terminal_colors = 1
    --vim.g.sonokai_colors_override = {
    --  bg0 = {'#1e222a', '235'},
    --  bg2 = {'#282c34', '236'},
    --  red = {'#000000',   '203'},
    --  ornge = {'#ff0060',   '015'},
    --}

    vim.cmd([[colorscheme sonokai]])
  end
}
