local M = {}

local icons = {
  [vim.diagnostic.severity.ERROR] = "✘",
  [vim.diagnostic.severity.WARN]  = "",
  [vim.diagnostic.severity.HINT]  = "💡",
  [vim.diagnostic.severity.INFO]  = "",
}
vim.diagnostic.config({
  virtual_text  = true,
  underline     = true,
  severity_sort = true,
  signs         = { text = icons },
})

function M.on_attach(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n','gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n','K',  vim.lsp.buf.hover,      opts)
  vim.keymap.set('n','<leader>rn', vim.lsp.buf.rename,     opts)
  vim.keymap.set('n','<leader>ca', vim.lsp.buf.code_action,opts)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M

