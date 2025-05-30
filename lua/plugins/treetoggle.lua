return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = true,
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
      },
    })
  end,
}

