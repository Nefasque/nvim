return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.sonokai_transparent_background = 2
		vim.g.sonokai_show_eob = 0
		vim.g.sonokai_dim_inactive_windows = 1
		vim.g.sonokai_disable_terminal_colors = 0
		vim.g.sonokai_disable_italic_comment = 1
		vim.g.sonokai_enable_italic = 0
		vim.g.sonokai_better_performance = 1

		local coloscheme = require("utils").get_colorscheme()

		vim.g.sonokai_colors_override = {
			black = { coloscheme["color0"], "232" },
			bg_dim = { coloscheme["gray1"], "232" },
			bg0 = { coloscheme["color0"], "235" },
			bg1 = { coloscheme["gray1"], "236" },
			bg2 = { coloscheme["gray2"], "236" },
			bg3 = { coloscheme["gray2"], "237" },
			bg4 = { coloscheme["gray2"], "237" },
			bg_red = { coloscheme["color1"], "203" },
			diff_red = { coloscheme["color8"], "52" },
			bg_green = { coloscheme["color2"], "107" },
			diff_green = { coloscheme["color10"], "22" },
			bg_blue = { coloscheme["color4"], "110" },
			diff_blue = { coloscheme["color12"], "17" },
			diff_yellow = { coloscheme["color3"], "54" },
			fg = { coloscheme["color7"], "250" },
			red = { coloscheme["color1"], "203" },
			green = { coloscheme["color2"], "107" },
			yellow = { coloscheme["color3"], "179" },
			blue = { coloscheme["color4"], "110" },
			purple = { coloscheme["color5"], "176" },
			orange = { coloscheme["color6"], "215" },
			grey = { coloscheme["color8"], "246" },
			grey_dim = { coloscheme["color8"], "240" },
			none = { "NONE", "NONE" },
		}

		vim.cmd([[colorscheme sonokai]])
		local hl = require("utils").hl

		hl("WinSeparator", { fg = coloscheme["color3"] })
		hl("FloatBorder", { fg = coloscheme["color3"], bg = "none" })
		hl("FloatTitle", { fg = coloscheme["color1"], bg = "none" })
		hl("NormalFloat", { fg = coloscheme["color7"], bg = "none" })
		hl("Pmenu", { link = "NormalFloat" })
		hl("BlinkCmpMenuBorder", { link = "FloatBorder" })
		hl("BlinkCmpDocBorder", { link = "FloatBorder" })
		hl("BlinkCmpSignatureHelpBorder", { link = "FloatBorder" })
		hl("CursorLine", { bg = coloscheme["gray1"] })
		hl("ColorColumn", { bg = coloscheme["gray1"] })
		hl("VirtualTextError", { fg = coloscheme["gray3"] })

		hl("Cursor", { fg = "NONE", bg = coloscheme["color7"] })
		-- hl("CursorIM", { fg = coloscheme["color7"], bg = coloscheme["color0"] })

		-- color main
		hl("ColorBlue", { fg = coloscheme["colorBlue"] })
		hl("ColorGreen", { fg = coloscheme["colorGreen"] })
		hl("colorRed", { fg = coloscheme["colorRed"] })
		hl("colorYellow", { fg = coloscheme["colorYellow"] })
		hl("colorPurple", { fg = coloscheme["colorPurple"] })
		hl("colorOrange", { fg = coloscheme["colorOrange"] })

		-- block highligh
		hl("blockred", { fg = coloscheme["color0"], bg = coloscheme["color1"] })
		hl("blockgreen", { fg = coloscheme["color0"], bg = coloscheme["color2"] })
		hl("blockyellow", { fg = coloscheme["color0"], bg = coloscheme["color3"] })
		hl("blockblue", { fg = coloscheme["color0"], bg = coloscheme["color4"] })
		hl("blockpurple", { fg = coloscheme["color0"], bg = coloscheme["color5"] })
		hl("blockorange", { fg = coloscheme["color0"], bg = coloscheme["color6"] })
		hl("blockfg", { fg = coloscheme["color0"], bg = coloscheme["color7"] })

		-- colo Mesages
		hl("ErrorMsg", { link = "colorRed" })
		hl("Error", { link = "colorRed" })
		hl("ErrorFloat", { link = "colorRed" })
		hl("ErrorText", { link = "colorRed" })
		hl("ErrorLine", { link = "colorRed" })
		hl("VirtualTextError", { fg = coloscheme["colorRed"], italic = true, underline = true })

		hl("WarningMsg", { link = "colorYellow" })
		hl("Warning", { link = "colorYellow" })
		hl("WarningFloat", { link = "colorYellow" })
		hl("WarningText", { link = "colorYellow" })
		hl("WarningLine", { link = "colorYellow" })
		hl("VirtualTextWarning", { fg = coloscheme["colorYellow"], italic = true, underline = true })

		hl("InfoMsg", { link = "colorGreen" })
		hl("InfoFloat", { link = "colorGreen" })
		hl("InfoText", { link = "colorGreen" })
		hl("InfoLine", { link = "colorGreen" })
		hl("VirtualTextInfo", { fg = coloscheme["colorGreen"], italic = true, underline = true })

		hl("HintMsg", { link = "colorBlue" })
		hl("HintFloat", { link = "colorBlue" })
		hl("HintText", { link = "colorBlue" })
		hl("HintLine", { link = "colorBlue" })
		hl("VirtualTextHint", { fg = coloscheme["colorBlue"], italic = true, underline = true })

		-- color diagnostic
		hl("DiagnosticError", { link = "colorRed" })
		hl("DiagnosticSignError", { link = "DiagnosticError"})
		hl("DiagnosticWarn", { link = "colorYellow" })
		hl("DiagnosticSignWarn", { link = "DiagnosticWarn"})
		hl("DiagnosticHint", { link = "colorBlue" })
		hl("DiagnosticSignHint", { link = "DiagnosticHint"})
		hl("DiagnosticInfo", { link = "colorGreen" })
		hl("DiagnosticSignInfo", { link = "DiagnosticInfo"})

		--minidiff
		hl("MiniDiffSignAdd", { link = "colorGreen" })
		hl("MiniDiffSignDelete", { link = "colorRed" })
		hl("MiniDiffSignChange", { link = "colorBlue" })
		hl("MiniDiffOverAdd", { link = "blockgreen" })
		hl("MiniDiffOverDelete", { link = "blockred" })
		hl("MiniDiffOverChange", { link = "blockblue" })
		hl("MiniDiffOverContext", { link = "blockpurple" })

		--status line highlight
		hl("stlhl_pos", { link = "Blue" })

		-- custom highlight
		vim.cmd([[
      highlight! link @tag Red
      highlight! link @tag.delimiter Comment
      highlight! link @lsp.type.class Purple
      highlight! link @keyword blue
      highlight! link Visual @comment.warning
      "highlight! link CursorLine TelescopeSelection
    ]])
	end,
}
