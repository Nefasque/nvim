return {
    "Exafunction/windsurf.nvim",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "saghen/blink.compat",
    },
    require("codeium").setup({
    enable_cmp_source = true,
    virtual_text = {
        enabled = true,
        manual = false,
        filetypes = { "markdown", "text", "org" },
        default_filetype_enabled = true,
        idle_delay = 75,
        virtual_text_priority = 65535,
        map_keys = true,
        accept_fallback = nil,
        key_bindings = {
            accept = "<S-Tab>",
            accept_word = false,
            accept_line = false,
            clear = "true",
            next = "<M-]>",
            prev = "<M-[>",
        }
    }
})
}
