return {
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = true, -- uses default setup()
    },

    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "williamboman/mason.nvim" },
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = { "rust_analyzer" }, -- adjust as needed
        })
      end,
    }
}

-- :MasonInstall rust-analyzer codelldb
