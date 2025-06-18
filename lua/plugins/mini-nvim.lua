return {
	"echasnovski/mini.nvim",
	dependencies = {},
	version = "*",
	config = function()
		local hl = require("utils").hl
		local gXr = require("utils").get_xresources_value

		require("mini.pairs").setup()
		require("mini.surround").setup()
		-----
		require("mini.cursorword").setup()
		hl("MiniCursorword", { bg = gXr("gray2"), bold = false })
		hl("MiniCursorwordCurrent", { bg = gXr("gray3"), bold = false })
		-----
		require("mini.hipatterns").setup({ -- color text code rgb
			highlighters = {
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})

		require("mini.indentscope").setup({
			draw = {
				delay = 1,
				animation = require("mini.indentscope").gen_animation.none(),
				try_as_border = true,
				predicate = function(scope)
					if scope.body.is_incomplete then
						return true
					end
					if scope.body.indent == 2 or scope.border.indent == 0 then
						return false
					end
					return true
				end,
			},
		})

		require("mini.trailspace").setup()
		hl("MiniTrailspace", { bg = "none", fg = "none" })
		vim.keymap.set("n", "<leader>c", function()
			require("mini.trailspace").trim()
			require("mini.trailspace").trim_last_lines()
		end, { desc = "Toggle MiniTrailspace" })

		local animate = require("mini.animate")
		require("mini.animate").setup({
			cursor = {
				timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
			},
			scroll = {
				timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
			},
			close = { enable = false },
			open = { enable = false },
		})

		---- Notify ---
		local notify = require("mini.notify")
		notify.setup({
			content = {
				format = function(notif)
					if notif.level == "ERROR" then
						return notify.default_format(notif)
					end
					return notif.msg
				end,
				sort = function(notif_arr)
					table.sort(notif_arr, function(a, b)
						return a.ts_update > b.ts_update
					end)
					return notif_arr
				end,
			},
			window = {
				config = function()
					local has_statusline = vim.o.laststatus > 0
					local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
					return { border = "single", anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
				end,
				max_width_share = 0.400,
				winblend = 0,
			},
		})
		vim.notify = notify.make_notify()
		vim.keymap.set("n", "<F9>", notify.clear, { desc = "Remove all active notifications" })
		vim.keymap.set("n", "<leader>ln", notify.show_history, { desc = "Show history" })

		local gen_loader = require("mini.snippets").gen_loader
		require("mini.snippets").setup({
			snippets = {
				-- Load custom file with global snippets first (adjust for Windows)
				gen_loader.from_file("~/.config/nvim/snippets/global.json"),
				-- Load snippets based on current language by reading files from
				gen_loader.from_lang(),
			},
		})

		require("mini.pick").setup({
			window = { config = { border = "single" } },
		})
		require("mini.extra").setup()
		require("mini.git").setup()

		-- Use only HEAD name as summary string
		local format_summary_git = function(data)
			-- Utilize buffer-local table summary
			local summary = vim.b[data.buf].minigit_summary
			vim.b[data.buf].minigit_summary_string = summary.head_name or ""
		end

		local au_opts = { pattern = "MiniGitUpdated", callback = format_summary_git }
		vim.api.nvim_create_autocmd("User", au_opts)

		---- diff
		require("mini.diff").setup()
		local format_summary = function(data)
			local summary = vim.b[data.buf].minidiff_summary
			local t = {}
			if summary.add > 0 then
				table.insert(t, "%#MiniDiffSignAdd# " .. summary.add)
			end
			if summary.change > 0 then
				table.insert(t, "%#MiniDiffSignChange# " .. summary.change)
			end
			if summary.delete > 0 then
				table.insert(t, "%#MiniDiffSignDelete# " .. summary.delete)
			end
			table.insert(t, "%#Normal#")
			vim.b[data.buf].minidiff_summary_string = table.concat(t, " ")
		end
		local au_opts_diff = { pattern = "MiniDiffUpdated", callback = format_summary }
		vim.api.nvim_create_autocmd("User", au_opts_diff)
		----

		local MiniStatusline = require("mini.statusline")
		MiniStatusline.setup({
			content = {
				active = function()
					local stl = require("statusline")
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local diff = MiniStatusline.section_diff({ trunc_width = 75, icon = "" })
					local diagnostics = MiniStatusline.section_diagnostics({
						trunc_width = 50,
						signs = {
							ERROR = "%#DiagnosticSignError#󰅙 ",
							WARN = "%#DiagnosticSignWarn#󰀪 ",
							INFO = "%#DiagnosticSignInfo#󰋼 ",
							HINT = "%#DiagnosticSignHint#󰌵 ",
						},
					})
					return MiniStatusline.combine_groups({
						{ hl = "stlhl_mode", strings = { stl.mode() } },
						"%<",
						{ hl = "stlhl_path", strings = { stl.fileInfo() } },
						"%=", -- End left alignment
						{ hl = "ColorPurple", strings = { git, diff, diagnostics } },
						{ hl = "stlhl_pos", strings = { stl.cursorPos() } },
					})
				end,
			},
		})

		-- mini files ---
		require("mini.files").setup()
		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesWindowOpen",
			callback = function(args)
				local win_id = args.data.win_id
				-- Customize window-local settings
				vim.wo[win_id].winblend = 0
				local config = vim.api.nvim_win_get_config(win_id)
				config.border = "single"
				vim.api.nvim_win_set_config(win_id, config)
			end,
		})

		-- buf removre
		require("mini.bufremove").setup()
		require("mini.splitjoin").setup()

		local starter = require("mini.starter")
		starter.setup({
			items = { name = "-------------------------------------------------", action = "", section = "" },
			header = '\
						   ,#>             <#.\
					  ,K@>                 <@K.\
				  ,WK7`  ▖ ▖  ▐▘           `VKW.\
				,UWK7    ▛▖▌█▌▜▘▀▌▛▘▛▌▌▌█▌   VKWQ\
				WKKY     ▌▝▌▙▖▐ █▌▄▌▙▌▙▌▙▖    EKKD\
				VKKW.                        ,WKKV\
				 VKKW.    ______________    ,WKKV\
					`VKKWWWWWWWWWWWWWWWWWWWWWWKKV`\
						 `VM.    ,@KKKKM.    ,@7\
								`VKKKKK,,,,KKKKKV`',
			footer = "    Simple, beauty and speed finally gathered",
			content_hooks = {
				starter.gen_hook.aligning("center", "center"),
				starter.gen_hook.adding_bullet(" ", false),
			},
			query_updaters = "",
			silent = true,
		})
	end,
}
