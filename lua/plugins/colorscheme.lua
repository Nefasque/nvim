return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
    local get_Xresouce = require("utils.functions").get_xresources_color
		vim.g.sonokai_transparent_background = 2
		vim.g.sonokai_show_eob = 0
		vim.g.sonokai_dim_inactive_windows = 1
		vim.g.sonokai_disable_terminal_colors = 0
		vim.g.sonokai_disable_italic_comment = 1
		vim.g.sonokai_enable_italic = 0
		vim.g.sonokai_better_performance = 1
		-- decomentar para colores del Xresources
		vim.g.sonokai_colors_override = {
      black       = { get_Xresouce('color0'), '232' },
      bg_dim      = { get_Xresouce('gray1'), '232' },
      bg0         = { get_Xresouce('color0'), '235' },
      bg1         = { get_Xresouce('gray1'), '236' },
      bg2         = { get_Xresouce('gray2'), '236' },
      bg3         = { get_Xresouce('gray3'), '237' },
      bg4         = { get_Xresouce('gray4'), '237' },

      bg_red      = { get_Xresouce('color1'), '203' },
      diff_red    = { get_Xresouce('color8'), '52' },
      bg_green    = { get_Xresouce('color2'), '107' },
      diff_green  = { get_Xresouce('color10'), '22' },
      bg_blue     = { get_Xresouce('color4'), '110' },
      diff_blue   = { get_Xresouce('color12'), '17' },
      diff_yellow = { get_Xresouce('color3'), '54' },
      fg          = { get_Xresouce('color7'), '250' },
      red         = { get_Xresouce('color1'), '203' },
      green       = { get_Xresouce('color2'), '107' },
      yellow      = { get_Xresouce('color3'), '179' },
      blue        = { get_Xresouce('color4'), '110' },
      purple      = { get_Xresouce('color5'), '176' },
      orange      = { get_Xresouce('color6'), '215' },
      grey        = { get_Xresouce('color8'), '246' },
      grey_dim    = { get_Xresouce('color8'), '240' },
      none        = { 'NONE', 'NONE' }
    }

		vim.cmd([[colorscheme sonokai]])

    vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'none', fg = get_Xresouce('color3') })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none', fg = get_Xresouce('color3') })
    vim.api.nvim_set_hl(0, "cursorline", { fg = "none", bg = get_Xresouce('gray2') })
    vim.api.nvim_set_hl(0, "colorColumn", { fg = 'none', bg = get_Xresouce('gray2') })


    -- custom highlight 
    vim.cmd([[
      highlight! link @tag Red
      highlight! link @tag.delimiter Comment
      highlight! link @lsp.type.class Purple
      highlight! link @keyword blue 
      highlight WinSeparator guibg=bg guifg=#555555
      highlight! link Visual @comment.warning
      " highlight! link CursorLine TelescopeSelection
      highlight! NormalFloat guibg=NONE
      highlight! floatBorder guibg=NONE
      highlight! pmenu guibg=NONE
      highlight! link floatTitle Red
    ]])
	end,
}
