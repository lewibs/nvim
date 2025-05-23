return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    -- Optional: Add default capabilities if using cmp-nvim-lsp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Example: setup for Lua (so LspInfo shows something immediately)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    -- Add more servers here if needed
  end,
  keys = {
    {
      "<leader>e",
      function() vim.diagnostic.open_float() end,
      desc = "Show error under cursor",
    },
    {
      "<C-h>",
      function() vim.diagnostic.goto_next() end,
      desc = "Next diagnostic",
    },
    {
      "<C-j>",
      function() vim.diagnostic.goto_prev() end,
      desc = "Previous diagnostic",
    },
  },
}

