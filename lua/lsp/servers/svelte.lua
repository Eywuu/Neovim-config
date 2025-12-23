local lspconfig = require("lspconfig")
local common = require("lsp.common")

lspconfig.svelte.setup({
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  filetypes = { "svelte" },
  handlers = {
    ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      if result and result.diagnostics then
        local filtered_diagnostics = {}
        for _, diagnostic in ipairs(result.diagnostics) do
          local ignored_codes = {
            ["a11y-click-events-have-key-events"] = true,
            ["a11y-no-static-element-interactions"] = true,
            ["a11y-missing-attribute"] = true
          }

          if not ignored_codes[diagnostic.code] then
            table.insert(filtered_diagnostics, diagnostic)
          end
        end
        result.diagnostics = filtered_diagnostics
      end
      vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
    end
  }
})
