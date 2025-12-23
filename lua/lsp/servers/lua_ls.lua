local lspconfig = require("lspconfig")
local common = require("lsp.common")

lspconfig.lua_ls.setup({
	capabilities = common.capabilities,
	on_attach = common.on_attach,

	settings = {
		Lua = {

			completion = {
				callSnippet = "Replace",
			},

			diagnostics = {
				globals = { "vim" },
			},

			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
				},
			},

			telemetry = { enable = false },
		},
	}
})
