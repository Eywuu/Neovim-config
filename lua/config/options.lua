vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Pmenu",      { bg = "#44475a", fg = "#f8f8f2" })
    vim.api.nvim_set_hl(0, "PmenuSel",   { bg = "#6272a4", fg = "#f8f8f2" })
    vim.api.nvim_set_hl(0, "PmenuSbar",  { bg = "#44475a" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#6272a4" })
    vim.api.nvim_set_hl(0, "NormalFloat",{ bg = "#282a36", fg = "#f8f8f2" })
    vim.api.nvim_set_hl(0, "FloatBorder",{ bg = "#282a36", fg = "#6272a4" })
  end,
})

