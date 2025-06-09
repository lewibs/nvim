return { 
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>git", "<cmd>Git<cr>", { desc = "Open git controls" })
    end
}
