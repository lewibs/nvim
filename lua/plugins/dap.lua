return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local map = vim.keymap.set
      local opts = { silent = true, noremap = true }

      -- DAP keymaps
      map("n", "<leader>dc", function() dap.continue() end, vim.tbl_extend("force", { desc = "DAP: Continue" }, opts))
      map("n", "<leader>db", function() dap.toggle_breakpoint() end, vim.tbl_extend("force", { desc = "DAP: Toggle Breakpoint" }, opts))
      map("n", "<leader>di", function() dap.step_into() end, vim.tbl_extend("force", { desc = "DAP: Step Into" }, opts))
      map("n", "<leader>do", function() dap.step_over() end, vim.tbl_extend("force", { desc = "DAP: Step Over" }, opts))
      map("n", "<leader>du", function() dap.step_out() end, vim.tbl_extend("force", { desc = "DAP: Step Out" }, opts))
      map("n", "<leader>dr", function() dap.repl.open() end, vim.tbl_extend("force", { desc = "DAP: Open REPL" }, opts))
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

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- DAP UI keymaps
      local map = vim.keymap.set
      local opts = { silent = true, noremap = true }

      map("n", "<leader>dt", function() dapui.toggle() end, vim.tbl_extend("force", { desc = "DAP UI Toggle" }, opts))
      map("n", "<leader>de", function() dapui.eval() end, vim.tbl_extend("force", { desc = "DAP Evaluate" }, opts))
    end,
  },
}

