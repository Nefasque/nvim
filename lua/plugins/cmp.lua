return {
  "hrsh7th/nvim-cmp",

  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
    -- order
    "lukas-reineke/cmp-under-comparator",

    -- motor de snippets
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    -- auto cerrado de pares
    "windwp/nvim-autopairs",

    -- icons
    "onsails/lspkind.nvim",
    {
      "Exafunction/codeium.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("codeium").setup({})
      end
    }
  },
  main = "config.plugins.cmp",
  config = true,
}
