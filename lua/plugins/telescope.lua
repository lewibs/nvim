if vim.fn.executable("rg") == 0 then
  vim.notify("Ripgrep (rg) is not installed. Live Grep won't work.", vim.log.levels.WARN)
end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
      })

      -- Define opts once
      local opts = { noremap = true, silent = true }

      -- Shortcut
      local map = vim.keymap.set

      -- Telescope keybindings
      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", vim.tbl_extend("force", { desc = "Find Files" }, opts))
      map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", vim.tbl_extend("force", { desc = "Live Grep" }, opts))
      map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", vim.tbl_extend("force", { desc = "Search Git" }, opts))
      -- map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", vim.tbl_extend("force", { desc = "Find Buffers" }, opts))
      -- map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", vim.tbl_extend("force", { desc = "Find Help" }, opts))
    end,
  },
}

