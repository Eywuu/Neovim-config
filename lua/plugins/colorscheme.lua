return {
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("dracula")
		-- end,
	},

	{
		"cryptomilk/nightcity.nvim",
		version = '*',
		priority = 1000,
		config = function()
			require("nightcity").setup({
				style = "kabuki",

				terminal_colors = true,
				invert_colors = {
				cursor = true,
				diff = true,
				error = true,
				search = true,
				selection = true,
				signs = false,
				statusline = true,
				tabline = false,
				},

				font_style = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = { italic = true },
					variables = { italic = true },
					search = { bold = true }
				},

				on_highlights = function(groups, c)
					groups.String = { fg = c.none, bg = c.none }
				end,
			})

			vim.cmd.colorscheme("nightcity")
		end,
	}

	-- {
	-- 	"tiesen243/vercel.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("vercel").setup({
	-- 			theme = "light",
	-- 			transparent = false,
	-- 			italics = {
	-- 				comments = true,
	-- 				keywords = true,
	-- 				functions = true,
	-- 				strings = true,
	-- 				variables = true,
	-- 				bufferline = true
	-- 			}
	-- 		})
	-- 		vim.cmd.colorscheme("vercel")
	-- 	end,
	-- }
}

