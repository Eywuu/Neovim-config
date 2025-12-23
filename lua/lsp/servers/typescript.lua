local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local common = require("lsp.common")

lspconfig.ts_ls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,

	fileypes = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact"
	},

	root_dir = util.root_pattern(
		"tsconfig.json",
		"package.json",
		"jsconfig.json",
		".git"
	),
})
