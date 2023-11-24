return {
  'NvChad/nvim-colorizer.lua',
  cmd = {
    "ColorizerToggle",
    "ColorizerReloadAllBuffers",
    "ColorizerDetachFromBuffer",
    "ColorizerAttachToBuffer"
  },
  opts = {
    filetypes = { "*" },
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      AARRGGBB = false,   -- 0xAARRGGBB hex codes
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = false,
      mode = "background",
      tailwind = false,
      sass = { enable = false, parsers = { "css" }, },
      virtualtext = "■",
      always_update = false
    },
  }
}
