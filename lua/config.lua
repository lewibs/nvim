vim.opt.undofile = true           -- Enable undo history across sessions (behavior)

vim.cmd("colorscheme habamax")    -- Style
vim.opt.number = true             -- Show line numbers (style)
vim.opt.relativenumber = true     -- Show relative line numbers (style)
vim.opt.splitbelow = true         -- New horizontal splits go below (style)
vim.opt.splitright = true         -- New vertical splits go to the right (style)

vim.opt.expandtab = true          -- Convert tabs to spaces (style)
vim.opt.tabstop = 4           -- A tab counts as 4 spaces (when reading)
vim.opt.shiftwidth = 4        -- Indent by 4 spaces
vim.opt.softtabstop = 4       -- Number of spaces a <Tab> counts for in insert mode
vim.opt.smartindent = true    -- Smart autoindenting on new lines
vim.opt.autoindent = true     -- Copy indent from current line when starting a new line

vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.g.mapleader = " "


