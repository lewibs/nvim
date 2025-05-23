return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Keymaps for any language
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "DAP: Step Out" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "DAP UI Toggle" })
      vim.keymap.set("n", "<leader>de", function() dapui.eval() end, { desc = "DAP Evaluate" })
    end,
  },
}

