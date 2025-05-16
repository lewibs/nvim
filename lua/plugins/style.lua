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
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch" },
                    lualine_c = { "filename" },
                    lualine_x = {
                        require("wpm").wpm,  -- 🚀 Add WPM display here
                        "encoding", "fileformat", "filetype"
                    },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
               }
            })
        end,
    },

    {
        "jcdickinson/wpm.nvim",
        event = "VeryLazy",
        config = function()
            require("wpm").setup({
                update_interval = 100,         -- How often to update WPM (lower = faster)
                progress_view = true,          -- Shows the WPM meter bar
                display_format = "WPM: %d"     -- Customize how WPM is shown
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

    -- Syntax for languages
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
          ensure_installed = { "java", "lua" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    }
}
