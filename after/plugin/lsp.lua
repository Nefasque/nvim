vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		vim.bo[event.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

		local keymap = function(mode, keys, func, desc)
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- kaymap
		local b = vim.lsp.buf
		keymap("n", "<leader>br", b.rename, "[R]ename Refencie")
		keymap("n", "<leader>bc", b.code_action, "Code Action")
		keymap("n", "<leader>bR", b.references, "Lists all the References to the symbol")
		keymap("n", "<leader>bn", b.definition, "go to the Denifinitont to the symbol")
		keymap("n", "<leader>bi", b.implementation, "got to the Implementations for the symbol")
		keymap("n", "<leader>bd", b.declaration, "go to the Declarations for the symbol")
		keymap("n", "<leader>bs", b.document_symbol, "Lists all Symbols")
		keymap("n", "<leader>bf", b.format, "Lists all the subtypes or supertypes")

		local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

-- config for all lsp
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	virtual_text = true,
	current_line = true,
})

vim.lsp.config("*",{
	capabilities = {
		textDocument = {
			foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true
			}
		}
	}
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable('bashls')
vim.lsp.enable('emmet_language_server')
vim.lsp.enable('somesass_ls')
