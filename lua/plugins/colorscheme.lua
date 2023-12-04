local get_Xresouce = require("utils.functions").get_xresources_color

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
    vim.g.sonokai_better_performance = 0
    -- decomentar para colores del Xresources
    vim.g.sonokai_colors_override = {
     black       = { get_Xresouce('color0'), '232' },
     bg_dim      = { '#222327', '232' },
     bg0         = { '#2c2e34', '235' },
     bg1         = { '#33353f', '236' },
     bg2         = { '#363944', '236' },
     bg3         = { '#3b3e48', '237' },
     bg4         = { '#414550', '237' },

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
  end
}
