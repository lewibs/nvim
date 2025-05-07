return {
    -- 📊 Status Line
    {
        "https://github.com/nvim-lualine/lualine.nvim",
        dependencies = {
            "https://github.com/nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox",
                    section_separators = '',
                    component_separators = '',
                }
            })
        end,
    },

    -- 📐 Indent guides
    {
        "https://github.com/lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- 🔍 Detect tabstop and shiftwidth automatically
    {
        "https://github.com/tpope/vim-sleuth",
        lazy = true,
    },

    -- 🧬 Git indicators
    {
        "https://github.com/lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
}
