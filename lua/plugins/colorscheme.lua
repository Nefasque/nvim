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
    vim.g.sonokai_better_performance = 0
    --vim.g.sonokai_colors_override = {
      --  bg0 = {'#1e222a', '235'},
      --  bg2 = {'#282c34', '236'},
      --  red = {'#000000',   '203'},
      --  ornge = {'#ff0060',   '015'},
      --
      --blue = { '#fc5d7c', '203' },

      --bg_blue = { '#ff6077', '203' },
      --bg_red = { '#85d3f2', '110' },

      --red = {'#9ed072',   '107'},
      --green = { '#76cce0', '110' },
    --}
    --
    vim.g.sonokai_lsp_kind_color = {
      {"Operator", "#ff00ff"},
    }
    --vim.call(
    --  sonokai#highlight('Title', s:palette.red, s:palette.none, 'bold')
    --)

    vim.api.nvim_command("highlight Operator guifg=" .. vim.fn.synIDattr(vim.fn.hlID('Operator'), 'fg') .. " guibg=#00ff00")



    vim.cmd([[colorscheme sonokai]])
  end
}
