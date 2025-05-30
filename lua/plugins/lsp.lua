return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    -- Optional: Add default capabilities if using cmp-nvim-lsp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Example: setup for Lua (so LspInfo shows something immediately)
    -- lspconfig.lua_ls.setup({
    --   capabilities = capabilities,
    -- })

    -- Add more servers here if needed
    -- Rust I use mason else where??
    -- lspconfig.rust_analyzer.setup({
    --   capabilities = capabilities,
    --   settings = {
    --     ["rust-analyzer"] = {
    --       cargo = { allFeatures = true },
    --       checkOnSave = { command = "clippy" },
    --     },
    --   },
    -- })
  end, 
}

