local ibl = require("ibl")

ibl.setup({
	debounce = 200,

	indent = {
		char = " ",
		tab_char = " ",
		smart_indent_cap = true,
	},

	whitespace = {
		remove_blankline_trail = false,
	},

	scope = {
		enabled = true,
		char = ":",
		show_start = false,
		show_end = false,
		show_exact_scope = false,
		highlight = "iblIndent",
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
