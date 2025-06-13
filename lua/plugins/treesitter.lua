return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "c", "cpp", "rust", "lua" },
				highlight = { enabled = true },
				indent = { enable = false },
				incremental_selection = { enable = true },
				textobjects = { enable = true },
			}
		end, -- config
	}
}

