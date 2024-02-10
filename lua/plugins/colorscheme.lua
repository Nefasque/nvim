-- local get_Xresouce = require("utils.functions").get_xresources_color

return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.sonokai_transparent_background = 2
		vim.g.sonokai_cursor = "red"
		vim.g.sonokai_show_eob = 0
		vim.g.sonokai_dim_inactive_windows = 1
		vim.g.sonokai_disable_terminal_colors = 1
		vim.g.sonokai_disable_italic_comment = 1
		vim.g.sonokai_enable_italic = 0
		vim.g.sonokai_better_performance = 1
		vim.cmd([[colorscheme sonokai]])

    -- custom highlight 
    vim.cmd([[
      highlight! link @tag Red
      highlight! link @tag.delimiter Comment
      highlight! link @lsp.type.class Purple
      highlight! link @keyword blue 
      highlight WinSeparator guibg=bg guifg=#555555
      highlight! link Visual @comment.warning
      highlight! link CursorLine TelescopeSelection
    ]])

	end,
}
