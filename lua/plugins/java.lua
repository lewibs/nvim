return { -- Java Language Server: only loads for Java files
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

      jdtls.start_or_attach({
        cmd = { "jdtls" }, -- assumes jdtls is installed and on your PATH
        root_dir = root_dir,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  },
}
