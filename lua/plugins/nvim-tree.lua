return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local api = require("nvim-tree.api")

      -- buffer‑local mappings for nvim-tree
      local function on_attach(bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<CR>",           api.node.open.edit,        bufopts)
        vim.keymap.set("n", "o",              api.node.open.edit,        bufopts)
        vim.keymap.set("n", "<2-LeftMouse>",  api.node.open.edit,        bufopts)
        vim.keymap.set("n", "a",              api.fs.create,             bufopts)
        vim.keymap.set("n", "d",              api.fs.remove,             bufopts)
        vim.keymap.set("n", "r",              api.fs.rename,             bufopts)
        -- toggle showing hidden (dot) files
        vim.keymap.set("n", "h",              api.tree.toggle_hidden_filter, bufopts)
      end

      require("nvim-tree").setup({
        sort_by   = "name",
        on_attach = on_attach,

        view = {
          width = 30,
          side  = "left",
        },

        renderer = {
          highlight_git = true,
          icons = {
            show = {
              file   = true,
              folder = true,
              git    = true,
            },
          },
        },
      })

      -- global mappings to toggle/focus tree
      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
      vim.keymap.set("n", "<C-h>", "<cmd>NvimTreeFocus<CR>",  { desc = "Focus NvimTree" })

      -- Auto‐toggle tree when launching nvim on a directory
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function(data)
          local dir = data.file
          if dir and vim.fn.isdirectory(dir) == 1 then
            vim.cmd.cd(dir)
            api.tree.toggle()  -- toggle(), not open()
          end
        end,
      })
    end,
  },
}

