return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")

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

        -- Ctrl+c based DAP keybindings
        vim.keymap.set("n", "<C-c>", dap.continue, { desc = "DAP: Continue" })
        vim.keymap.set("n", "<C-o>", dap.step_over, { desc = "DAP: Step Over" })
        vim.keymap.set("n", "<C-i>", dap.step_into, { desc = "DAP: Step Into" })
        vim.keymap.set("n", "<C-u>", dap.step_out, { desc = "DAP: Step Out" })
        vim.keymap.set("n", "<C-b>", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
        --vim.keymap.set("n", "<C-r>", dap.repl.open, { desc = "DAP: Open REPL" })
      end,
    },
  },
}

