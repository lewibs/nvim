return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Let jdtls provide the adapter via bundles
      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Attach to Java",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }

      -- Keymaps
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
            "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()

      -- Auto open/close UI on debug start/end
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps
      vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "DAP UI Toggle" })
      vim.keymap.set("n", "<leader>de", function() dapui.eval() end, { desc = "DAP Evaluate" })
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

      local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
      local bundles = {}

      local debug_jar = vim.fn.glob(mason_path .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
      if debug_jar ~= "" then
        table.insert(bundles, debug_jar)
      end

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

