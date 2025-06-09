return {
  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1  -- Auto focus on Undotree when toggled
      vim.g.undotree_WindowLayout = 3        -- Layout for the undotree window

      vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle Undotree" })
    end,
  },
}

