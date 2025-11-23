local icons = {
	[vim.diagnostic.severity.ERROR] = "✘",
	[vim.diagnostic.severity.WARN]  = "",
	[vim.diagnostic.severity.HINT]  = "💡",
	[vim.diagnostic.severity.INFO]  = "",
}

return {
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
				vim.diagnostic.config({
					virtual_text = false,
					virtual_lines = {
						only_current_line = true,
					},
					underline = true,
					signs = { text = icons },
					severity_sort = true,
			})
	end,
	}
}
