set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent

call plug#begin('~/.local/share/nvim/site/plugged')
" Theme stuff
Plug 'tiagovla/tokyodark.nvim'
Plug 'Mofiqul/dracula.nvim'

" LSP support
Plug 'neovim/nvim-lspconfig'

" Autocompletion engine and sources
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Snippet engine + source
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Treesitter for syntax highlighting, indentation, folding
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Nvim tree 
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" Lualine shit
Plug 'nvim-lualine/lualine.nvim'

" Console shit
Plug 'akinsho/toggleterm.nvim', { 'tag': 'v2.*' }

" Telescope stuff
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' } 
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'Ninja' }

" Autopair 
Plug 'windwp/nvim-autopairs'
call plug#end()
set termguicolors
colorscheme dracula

lua << EOF
    vim.o.winblend = 20
    vim.o.pumblend = 20

    vim.cmd([[
        highlight Pmenu         guibg=#44475a guifg=#f8f8f2
        highlight PmenuSel      guibg=#6272a4 guifg=#f8f8f2
        highlight PmenuSbar     guibg=#44475a
        highlight PmenuThumb    guibg=#6272a4

        highlight NormalFloat   guibg=#282a36 guifg=#f8f8f2
        highlight FloatBoarder  guibg=#282a36 guifg=#6272a4 
    ]])
EOF

" LSP settings for C/C++
lua << EOF
    local lspconfig = require('lspconfig')

    lspconfig.clangd.setup{
        cmd = {
            "clangd", 
            "--background-index",
            "--compile-commands-dir=build",
            "--fallback-style={BasedOnStyle: LLVM, PointerAlignment: Left" 
            },
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	on_attach = function(client, bufnr)
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
	    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

            if client.server_capabilities.documentFormattingProvider then 
                vim.api.nvim_create_augroup("LspFormatting", { clear = true })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = "LspFormatting",
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr, async = false })
                    end,
                })
            end
        end,
	filetypes = {"c", "cpp", "objc", "objcpp"},
	root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    }
EOF

" nvim-cmp setup
lua << EOF
  local cmp     = require('cmp')
  local luasnip = require('luasnip')

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
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>']      = cmp.mapping.confirm({ select = true }),
      ['<Tab>']     = cmp.mapping.select_next_item(),
      ['<S-Tab>']   = cmp.mapping.select_prev_item(),
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
      { name = 'path' },
    }),
  })

  -- cmdline completions
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } },
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'path' },
      { name = 'cmdline' },
    },
  })
EOF


" Treesitter configuration
lua << EOF
    require('nvim-treesitter.configs').setup {
        ensure_installed = { 'c', 'cpp', 'lua' },
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
    }
EOF

" Diagnostic display configuration: virtual text & float
lua << EOF
    vim.diagnostic.config({
        virtual_text = {
	    prefix = '●',
	    source = true,
	    format = function(diag) return diag.message end,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
    })
    -- keymap to show diagnostics in a floating window 
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap=true, silent=true })
EOF

" setup nvim-tree
lua << EOF
    require("nvim-tree").setup({
    sort_by = "name",
    view = {
        width = 30,
	side = "left",
	mappings = {
	    list = {
		    { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
		    { key = "a", action = "create" },
		    { key = "d", action = "remove" },
		    { key = "r", action = "rename" },
		    { key = "h", action = "toggle_hidden" },
	    },
	},
    },
    renderer = {
	    highlight_git = true,
	    icons = {
		    show = {
			    file = true,
			    folder = true,
			    git = true,
		    },
		    },
	    },
    })
EOF

" Keymap to toggle sidebar and other related stuff
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-h> :NvimTreeFocus<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | exe 'NvimTreeOpen' | endif

lua << EOF
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {},
      always_divide_middle = false,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {'nvim-tree'}
  }
EOF

" Terminal setup
lua << EOF
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
EOF

" Telescope settings and setup
lua << EOF
    local t = require('telescope.builtin')
    -- Telescope setup
    require('telescope').setup {
    defaults = {
        prompt_prefix = " ",
	selection_caret = " ",
	path_display = { "smart" },
	file_ignore_patterns = { "build/" },
    },
    pickers = {
        find_files = {
	    theme = "dropdown",
	},
	live_grep = {
	    theme = "ivy",
	},
    },
    extensions = {
        fzf = {
	    fuzzy = true,
	    override_generic_sorter = true,
	    override_file_sorter = true,
	    case_mode = "smart_case",
	    }
	}
    }
    require('telescope').load_extension('fzf')

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>ff', t.find_files, opts)
    vim.keymap.set('n', '<leader>fg', t.live_grep, opts)
    vim.keymap.set('n', '<leader>fb', t.buffers, opts)
    vim.keymap.set('n', '<leader>fh', t.help_tags, opts)
EOF

lua << EOF
    require('nvim-autopairs').setup({
        check_ts = true,
	fast_wrap = {},
	disabled_filetype = { "TelescopePrompt", "vim" },
    })
EOF
