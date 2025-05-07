return {
  {
    "hrsh7th/nvim-cmp",
    commit = "8c82d0bd31299dbff7f8e780f5e06d2283de9678",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          -- ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
            { name = "nvim_lsp" },  
            { name = "path" },
        },
      })
    end,
  },
}
