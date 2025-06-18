return {
	"tadaa/vimade",
	event = "VeryLazy",
	opts = {
		recipe = { "default", { animate = true } },
		fadelevel = 0.6,
		ncmode = "windows",
		blocklist = {
			my_blocklist = {
				buf_opts = { filetype = { "minipick", "minifiles", "mason", "lazy", "help" } },
			},
			default = {
				highlights = {
					"MiniStatuslineInactive",
					"CursorLine",
					"ColorColumn",
					"stlhl_mode",
					"stlhl_path",
					"ColorPurple",
					"blue",
					"MiniFilesFile",
					"MiniFilesTitleFocused",
					"MiniFilesBorder",
					"MiniFilesBorderModified",
					"MiniFilesCursorLine",
					"MiniFilesDirectory",
					"MiniFilesNormal",
					"MiniFilesTitle",
					"DiagnosticSignError",
					"DiagnosticSignWarn",
					"DiagnosticSignInfo",
					"DiagnosticSignHint",
				},
			},
		},
	},
}
