return {
  -- LSP config core
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    keys = {
      -- Show error under cursor with <leader>e
      {
        "<leader>e",
        function()
          vim.diagnostic.open_float()  -- Shows error under cursor in a floating window
        end,
        desc = "Show error under cursor",
      },
      
      -- Next diagnostic with Ctrl-n
      {
        "<C-h>",
        function()
          vim.diagnostic.goto_next()  -- Go to next diagnostic/error
        end, 
        desc = "Next diagnostic",
      },
      
      -- Previous diagnostic with Ctrl-m
      {
        "<C-j>",
        function()
          vim.diagnostic.goto_prev()  -- Go to previous diagnostic/error
        end,
        desc = "Previous diagnostic",
      },
    },
  },

  -- Autocompletion source for LSP
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },
}

