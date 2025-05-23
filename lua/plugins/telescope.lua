if vim.fn.executable("rg") == 0 then
  -- If ripgrep is not installed, show a warning
  vim.notify("Ripgrep (rg) is not installed. Live Grep won't work.", vim.log.levels.WARN)
end

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
        },
      })
    end
  },
}

