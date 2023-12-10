local null_ls = require("null-ls")

-- hello my fre

local formatting = null_ls.builtins.formatting
--local completion = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

null_ls.setup({
	sources = {
		-- formant
		formatting.stylua.with({ filetypes = { "lua" } }),

		formatting.prettier.with({
			filetypes = { "html", "markdown", "css", "js", "javascript" },
		}),
	},

	on_attach = function(client, bufnr)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end)

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
