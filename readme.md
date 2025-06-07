# My own Neovim Configuration for C++ development

A feature-rich, performant Neovim setup powered by Lua and Vimscript, designed for modern development workflows. 
This configuration includes themes, LSP, autocompletion, snippets, syntax highlighting, file navigation, fuzzy finding, statusline, terminal integration, and more.

---

## 📦 Prerequisites

**Before installing, ensure you have:**

* Neovim v0.5.0 or later

* Git for cloning the repo and plug.vim

* Clangd

* CMake 

* Ninja build tools 

* Clang compiler

---

## ⚙️ Installation

* Clone this repository

* git clone https://github.com/Eywuu/Neovim-config.git ~/.config/nvim

**Install plugins**

* Open Neovim and run:

**:PlugInstall**

Enjoy!

Restart Neovim. All plugins and keybindings should be active.

## Note! 
You might need to build the fzf library yourself, head to it's installation destination and build it using cmake and ninja 

---

## 🌟 Features

* Dracula theme

* LSP (clangd)

* Native LSP integration for code navigation, hover, rename, etc.

* Completion

* nvim-cmp, cmp-nvim-lsp, cmp-buffer, cmp-path

* Contextual autocompletion with fuzzy matching and snippet support.

* Snippets

* Improved highlighting, indentation, and text objects with treesitter

* File Explorer with nvim-tree

* Sidebar file browser with icons and Git status.

* Statusline, customizable 

* Fuzzy Finder

* Terminal

* Autopairs

* Diagnostics

---

## 🎯 Keybindings

* Toggle file explorer: C-n

* Focus file explorer: C-h

* Show diagnostics float: leader-e

* Go to definition: gd

* Hover documentation: K

* Rename symbol: leader-rn

* Code action: leader-ca

* Find files: leader-ff

* Live grep: leader-fg

* List open buffers: leader-fb

* Help tags: leader-fh

* Toggle terminal: c-\

* Navigate completion menu: Tab  / S-Tab

* Trigger completion: C-Space

* Confirm completion: CR

---

## 🔧 Customization

* Change theme: Install your preferred theme using Plug.

* LSP: In the LSP block, change to your desired settings.

* Adjust Treesitter parsers: Modify the ensure_installed list for additional languages and freatures.

* Extend Telescope: Add or configure pickers and extensions in the Telescope setup block.

* Modify keymaps: All custom mappings live in init.vim; feel free to rebind to your preference.

---

