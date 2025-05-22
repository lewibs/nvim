
return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    -- Java DAP adapter (attach)
    dap.adapters.java = function(callback)
      callback({
        type = "server",
        host = "127.0.0.1",
        port = 5005,
      })
    end

    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Attach to Java",
        hostName = "127.0.0.1",
        port = 5005,
      }
    }

    -- Common leader-based DAP keybindings
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
    vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "DAP: Step Out" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
  end,
}

