local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, layzpath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Cloning of lazy.nvim failed:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any ket to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },

  install = { colorscheme = { "dracula" } },
  checker = { enabled = false },
})
