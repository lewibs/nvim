return {
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

      require("jdtls").start_or_attach({
        cmd = { "jdtls" },
        root_dir = root_dir,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        init_options = {
          bundles = bundles,
        },
      })

      -- Java-specific DAP config
      local dap = require("dap")
      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Attach to Java",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
  },
}

