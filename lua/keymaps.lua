local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope keybindings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files", unpack(opts) })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep", unpack(opts) })
-- map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Search Git", unpack(opts) })
-- map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find Buffers", unpack(opts) })
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help", unpack(opts) })

-- LSP bindings
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show error under cursor" })
vim.keymap.set("n", "<C-h>", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })


-- DAP
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "DAP: Continue" })
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<leader>du", function() require("dap").step_out() end, { desc = "DAP: Step Out" })
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "DAP: Open REPL" })

-- DAP UI
vim.keymap.set("n", "<leader>dt", function() require("dapui").toggle() end, { desc = "DAP UI Toggle" })
vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end, { desc = "DAP Evaluate" })

-- Harpoon
vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<leader>r", function() require("harpoon.mark").rm_file() end, { desc = "Remove file from Harpoon" })
vim.keymap.set("n", "<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Harpoon menu" })
vim.keymap.set("n", "<C-n>", function() require("harpoon.ui").nav_next() end, { desc = "Next file in Harpoon" })
vim.keymap.set("n", "<C-m>", function() require("harpoon.ui").nav_prev() end, { desc = "Previous file in Harpoon" })
-- vim.keymap.set("n", "<C-1>", function() require("harpoon.ui").nav_file(1) end, { desc = "Go to file 1" })
-- vim.keymap.set("n", "<C-2>", function() require("harpoon.ui").nav_file(2) end, { desc = "Go to file 2" })
-- vim.keymap.set("n", "<C-3>", function() require("harpoon.ui").nav_file(3) end, { desc = "Go to file 3" })

-- fugitive
vim.keymap.set("n", "<leader>git", "<cmd>Git<cr>", { desc = "Open git controls" })

-- tree-toggle
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "ToggleNvimTree" } )

-- undotree
vim.keymap.set("n", "<leader>t", "<cmd>UndoTreeToggle<cr>", { desc = "Toggle Undotree" })


-- Other
vim.keymap.set("n", "<CR>", "i", { noremap = true, silent = true })

