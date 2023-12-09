return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
    {
      "nvimtools/none-ls.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      }
    }
  },
  config = true,
  main = "config.lsp",
}
