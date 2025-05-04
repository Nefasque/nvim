return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'Exafunction/codeium.nvim',
      -- 'rafamadriz/friendly-snippets',
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        name = "luasnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<S-Tab>"] = {},
        ["<Tab>"] = {},
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-j>"] = { "snippet_backward", "fallback" },
      },
      appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true,
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            if vim.tbl_contains({ "markdown" }, vim.bo.filetype) then
              return false
            end

            return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
          end,
          border = 'single',
          scrollbar = false,
        },
        documentation = {
          auto_show = true,
          auto_show = false,
          window = {
            border = 'single',
            scrollbar = false,
          },
        },
        ghost_text = { enabled = false },
      },
      signature = {
        enabled = true,
        window = { border = 'single' },
        trigger = {
          enabled = false,
        },
      },
      -- snippets = {
      --  preset = "luasnip",
      -- },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- providers = {
        --   codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
        -- },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
