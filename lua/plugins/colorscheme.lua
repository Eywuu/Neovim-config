return {
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	priority = 1000,
	-- 	config = function() 
	-- 		require("gruvbox").setup({
	-- 			terminal_colors = false, 
	-- 			undercurl = true,
	-- 			underline = true,
	-- 			bold = true,
	-- 			italic = {
	-- 				strings = true,
	-- 				emphasis = true,
	-- 				comments = true,
	-- 				operators = false,
	-- 				folds = true,
	-- 			},
	-- 			strikethrough = true,
	-- 			invert_selection = false,
	-- 			invert_signs = false,
	-- 			invert_tabline = false,
	-- 			inverse = true, 
	-- 			contrast = "", 
	-- 			palette_overrides = {},
	-- 			overrides = {},
	-- 			dim_inactive = false,
	-- 			transparent_mode = false,
	-- 		})
	-- 		vim.cmd.colorscheme("gruvbox")
	-- end,
	-- }
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('vscode').setup({
				transparent = false,
				italic_comments = true,
				disable_nvimtree_bg = false,
				color_overrides = {},
				group_overrides = {},
		})
		require('vscode').load('dark')
	end,
	}
}
