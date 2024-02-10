local ibl = require("ibl")
local hooks = require("ibl.hooks")

ibl.setup({
	debounce = 200,

	indent = {
		char = "╎",
		tab_char = "┊",
		smart_indent_cap = true,
		repeat_linebreak = false,
	},

	whitespace = {
		remove_blankline_trail = false,
	},

	scope = {
		enabled = true,
		char = "┆",
		show_start = false,
		show_end = false,
		show_exact_scope = false,
		highlight = "Comment",
	},
	exclude = {
		filetypes = {
			"help",
			"terminal",
			"lazy",
			"lspinfo",
			"TelescopePrompt",
			"TelescopeResults",
			"mason",
			"checkhealth",
			"man",
			"gitcommit",
			"",
		},
	},
})

hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

-- IndentBlanklineContextChar xxx links to IblScope
-- vim.cmd([[
--   highlight @ibl.scope.char.1 guifg=orange
--   highlight @ibl.indent.char.1 guifg=orange
-- ]])
