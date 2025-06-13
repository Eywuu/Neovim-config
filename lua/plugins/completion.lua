return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip"
		},
		
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			
  	local rounded_border_style = {
    	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    	winhighlight = "Normal:CmpMenu,CursorLine:PmenuSel,Search:None" 
  	}

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

		window = {
			completion = cmp.config.window.bordered(rounded_border_style),
			documentation = cmp.config.window.bordered(rounded_border_style),
		},

		mapping = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping.select_next_item(),
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
		}),

		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		},

		{
			{ name = "buffer" },
			{ name = "path" }, })
		})
		
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = { { name = "buffer" } },
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "path" },
				{ name = "cmdline" },
			},
		})
	  end, -- config function
	}
}

