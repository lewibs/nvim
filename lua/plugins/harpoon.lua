return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        -- You can add additional Harpoon config options here if needed
      })
    end,
    keys = {
      { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add file to Harpoon" },
      { "<leader>r", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove file from Harpoon" },
      { "<leader>m", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Harpoon menu" },
      { "<C-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Next file in Harpoon" },
      { "<C-p>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Previous file in Harpoon" },
      -- { "<C-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to file 1" },
      -- { "<C-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to file 2" },
      -- { "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to file 3" },
    },
  },
}

