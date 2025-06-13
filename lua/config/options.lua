vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight Pmenu         guibg=#44475a guifg=#f8f8f2
      highlight PmenuSel      guibg=#6272a4 guifg=#f8f8f2
      highlight PmenuSbar     guibg=#44475a
      highlight PmenuThumb    guibg=#6272a4
      highlight NormalFloat   guibg=#282a36 guifg=#f8f8f2
      highlight FloatBorder   guibg=#282a36 guifg=#6272a4
    ]])
  end,
})

