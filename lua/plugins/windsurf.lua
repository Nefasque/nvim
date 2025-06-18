return {
	"Exafunction/windsurf.nvim",
	-- "krmcbride/windsurf.nvim",
	enabled = true,
	-- branch = "fix-blink-bufs-no-path",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- "mini.nvim",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = true,
			virtual_text = {
				enabled = false,
			},
		})
	end,
}
