---@diagnostic disable: missing-fields
local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- local lspkind = require("lspkind")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local M = {}
function M.setup()
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-o>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if cmp.visible_docs() then
						cmp.close_docs()
					else
						cmp.open_docs()
					end
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			["<C-n>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					else
						cmp.select_next_item()
					end
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- that way you will only jump inside the snippet region
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
					if #cmp.get_entries() == 1 then
						cmp.confirm({ select = true })
					end
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-p>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		sources = {
			{ name = "codeium" },
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "html-css" },
		},

		window = {
      documentation = cmp.config.window.bordered(),
			completion = {
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				col_offset = -3,
				side_padding = 1,
				scrollbar = false,
        border = "single",
			},
		},

		view = {
			docs = {
				auto_open = false,
			},
		},

		-- formatting = {
		-- 	format = lspkind.cmp_format({
		-- 		mode = "symbol", -- show only symbol annotations
		-- 		maxwidth = 50,
		-- 		ellipsis_char = "~",
		-- 		symbol_map = { Codeium = "" },
		-- 	}),
		-- },

		sorting = {
			comparators = {
				require("cmp-under-comparator").under,
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
	})

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

	-- Set configuration for specific filetype.
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "git" },
			-- You can specify the `git` source if
			-- [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
			{ name = "buffer" },
		}),
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, { { name = "cmdline" } }),
	})

	-- disable completion in comments
	cmp.enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end

	-- Disabling cmdline completion for certain commands, such as IncRename
	cmp.setup.cmdline(":", {
		sources = { --[[ your sources ]]
		},
		enabled = function()
			-- Set of commands where cmp will be disabled
			local disabled = {
				IncRename = true,
			}
			-- Get first word of cmdline
			local cmd = vim.fn.getcmdline():match("%S+")
			-- Return true if cmd isn't disabled
			-- else call/return cmp.close(), which returns false
			return not disabled[cmd] or cmp.close()
		end,
	})
end

return M
