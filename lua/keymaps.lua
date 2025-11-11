-- terminal
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("split | terminal cd " .. vim.fn.expand("%:p:h") .. " && $SHELL")
end)

-- chatgpt
vim.keymap.set("n", "<leader>c.", function()
  vim.cmd("vsp | terminal cd " .. vim.fn.expand("%:p:h") .. " && codex")
end)

vim.keymap.set("n", "<leader>c~", function()
    vim.cmd("vsp | terminal codex")
end)

-- Do NOT yank on delete or change:
vim.keymap.set({"n", "v", "o"}, "d", '"_d')
vim.keymap.set({"n", "v", "o"}, "c", '"_c')
vim.keymap.set({"n", "v"}, "x", '"_x')  
