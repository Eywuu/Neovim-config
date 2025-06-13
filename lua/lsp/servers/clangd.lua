local lspconfig = require("lspconfig")
local common = require("lsp.common")

lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--compile-commands-dir=build",
    "--enable-config",
  },
  init_options = {
    inlayHints = {
      parameterNames = { enabled = true },
      parameterTypes = { enabled = true },
      variableTypes  = { enabled = true },
    },
  },
  filetypes = { "c","cpp","objc","objcpp" },
  root_dir  = lspconfig.util.root_pattern(
    "compile_commands.json",
    "compile_flags.txt",
    ".git"
  ),

  on_attach    = common.on_attach,
  capabilities = common.capabilities,
})

