return {
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
        },
      }

      -- Keymaps (you can change these if needed)
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "DAP: Step Out" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
    end,
  },
  {
    "mwilsonsmarttech/nvim-jdtls",
    commit = "2f7bff9b8d2ee1918b36ca55f19547d9d335a268",
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls")
      local jdtls_setup = require("jdtls.setup")

      local root_markers = { ".git", "mvnw", "gradlew", "build.gradle", "pom.xml" }
      local root_dir = jdtls_setup.find_root(root_markers)
      if not root_dir then
        vim.notify("Java project root not found. jdtls not started.", vim.log.levels.WARN)
        return
      end

      -- Include the DAP plugin JAR built from java-debug
      local bundles = {
        vim.fn.glob("/Users/blewis/Downloads/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin.jar", 1),
      }

      jdtls.start_or_attach({
        cmd = { "jdtls" },
        root_dir = root_dir,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        init_options = {
          bundles = bundles,
        },
      })
    end,
  },
}

