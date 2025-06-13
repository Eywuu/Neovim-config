return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function() 
			require('toggleterm').setup{
    		size = 20,
    		open_mapping = [[<c-\>]],
    		shade_filetypes = {},
    		shade_terminals = true,
    		shading_factor = 2,
    		start_in_insert = true,
    		direction = 'horizontal',  -- 'vertical' | 'tab' | 'float'
    		float_opts = {
      		border = 'curved',
      		winblend = 3,
    		}
  		}
		end, -- config
	}
}
