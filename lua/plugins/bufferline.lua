return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
					show_buffer_close_icons = true,
					show_cose_icon = false,
					separator_style = "slant",
					always_show_bufferline = true,
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							highlight = "Directory",
							separator = true,
						},
					},
				},
			})
		end,
	}
}
