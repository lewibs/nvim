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
            port = 5005  -- standard Java debug port
          })
        end

        dap.configurations.java = {
          {
            type = "java",
            request = "attach",
            name = "Attach to Java",
            hostName = "127.0.0.1",
            port = 5005
          }
        }
      end
    }
  }
}

