return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Set global diagnostic keymaps
    map("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", { desc = "Show error under cursor" }, opts))
    map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", { desc = "Previous diagnostic" }, opts))
    map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", { desc = "Next diagnostic" }, opts))

    -- Define on_attach function
    local on_attach = function(_, bufnr)
      local bufopts = { buffer = bufnr, noremap = true, silent = true }
      map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", { desc = "Go to definition" }, bufopts))
      map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", { desc = "Hover" }, bufopts))
      map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", { desc = "Rename" }, bufopts))
      map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", { desc = "Code action" }, bufopts))
    end

    -- Example: Lua LSP
    -- lspconfig.lua_ls.setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })

    -- Example: Rust (if not using mason-lspconfig)
    -- lspconfig.rust_analyzer.setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   settings = {
    --     ["rust-analyzer"] = {
    --       cargo = { allFeatures = true },
    --       checkOnSave = { command = "clippy" },
    --     },
    --   },
    -- })
  end,
}
