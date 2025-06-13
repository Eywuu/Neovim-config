return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
        automatic_installation = true,
        handlers = {}, -- use default
      })

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      -- You can copy this if needed for C or Rust
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<F5>", dap.continue, opts)
      vim.keymap.set("n", "<F10>", dap.step_over, opts)
      vim.keymap.set("n", "<F11>", dap.step_into, opts)
      vim.keymap.set("n", "<F12>", dap.step_out, opts)
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, opts)
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, opts)
      vim.keymap.set("n", "<leader>dr", dap.repl.open, opts)
      vim.keymap.set("n", "<leader>dl", dap.run_last, opts)
      vim.keymap.set("n", "<leader>ds", dap.continue, opts)
    end,
  },
}

