return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1 or vim.fn.executable("ninja") == 1
        end,
      },
    },
    config = function()
      local t = require("telescope.builtin")
      require("telescope").setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { "build/" },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          },
          live_grep = {
            theme = "ivy",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      require("telescope").load_extension("fzf")

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<leader>ff", t.find_files, opts)
      vim.keymap.set("n", "<leader>fg", t.live_grep, opts)
      vim.keymap.set("n", "<leader>fb", t.buffers, opts)
      vim.keymap.set("n", "<leader>fh", t.help_tags, opts)
    end,
    cmd = "Telescope", -- lazy-load on use
    keys = {
      { "<leader>ff", desc = "Find Files" },
      { "<leader>fg", desc = "Live Grep" },
      { "<leader>fb", desc = "Buffers" },
      { "<leader>fh", desc = "Help Tags" },
    },
  },
}

