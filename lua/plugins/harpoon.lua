return {
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        -- You can add additional Harpoon config options here if needed
      })

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- Harpoon
      vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, { desc = "Add file to Harpoon" })
      vim.keymap.set("n", "<leader>r", function() require("harpoon.mark").rm_file() end, { desc = "Remove file from Harpoon" })
      vim.keymap.set("n", "<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Harpoon menu" })
      vim.keymap.set("n", "<C-n>", function() require("harpoon.ui").nav_next() end, { desc = "Next file in Harpoon" })
      -- vim.keymap.set("n", "<C-m>", function() require("harpoon.ui").nav_prev() end, { desc = "Previous file in Harpoon" })
      -- vim.keymap.set("n", "<C-1>", function() require("harpoon.ui").nav_file(1) end, { desc = "Go to file 1" })
      -- vim.keymap.set("n", "<C-2>", function() require("harpoon.ui").nav_file(2) end, { desc = "Go to file 2" })
      -- vim.keymap.set("n", "<C-3>", function() require("harpoon.ui").nav_file(3) end, { desc = "Go to file 3" })
    end,

  },
}

