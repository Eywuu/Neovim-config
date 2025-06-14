return {
	{
		"nvim-pack/nvim-spectre",
		event = "VeryLazy",
		keys = {
			{
				"<leader>S",
				function()
					require("spectre").toggle()
				end,
				desc = "Spectre: Toggle Search & Replace",
			},

			{
				"<leader>sw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				desc = "Spectre: Search current word",
			},

			{
				"<leader>sp",
				function()
					require("spectre").open_file_search()
				end,
				desc = "Spectre: Search in current file",
			},
		},

		config = function()
			require("spectre").setup({
				color_devicons = true,
				open_cmd = "noswapfile vnew",
				is_insert_mode = false,
				live_update = true,
				mapping = {
					toggle_line = { map = "dd", cmd = "<cmd>lua require('spectre.actions').toggle_line()<CR>", desc = "toggle current item" },
					toggle_stage = { map = "s", cmd = "<cmd>lua require('spectre.actions').toggle_stage()<CR>", desc = "stage current file" },
					replace_cmd = { map = "r", cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>", desc = "input replace vim command" },
					show_option_menu = { map = "o", cmd = "<cmd>lua require('spectre.actions').show_option_menu()<CR>", desc = "show option menu" },
					run_replace = { map = "<leader>r", cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>", desc = "replace all" },
					change_view_mode = { map = "m", cmd = "<cmd>lua require('spectre').change_view()<CR>", desc = "change result view mode" },
					resume_last_search = { map = "q", cmd = "<cmd>lua require('spectre').resume_last_search()<CR>", desc = "resume last search" },
				},
				highlight = {
					ui = "SpectreClear",
					search = "SpectreSearch",
					replace = "SprectreReplace",
				},
			})
		end,
	}
}
