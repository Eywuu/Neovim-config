local lspconfig = require("lspconfig")
local common    = require("lsp.common")

lspconfig.rust_analyzer.setup({
  on_attach    = common.on_attach,
  capabilities = common.capabilities,

  filetypes = { "rust" },
  root_dir  = lspconfig.util.root_pattern("Cargo.toml", "rust-project.json"),

  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,        
      },
      checkOnSave = {
        command = "clippy",       
      },
      procMacro = {
        enable = true,             
      },
      inlayHints = {
        lifetimeElisionHints = {
          enable     = true,
          useParameterNames = true,
        },
        bindingModeHints = { enable = true },
      },
      lens = {
        enable = true,             
      },
    },
  },
})

