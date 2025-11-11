-- terminal
vim.keymap.set("n", "<leader>ts", function()
  vim.cmd("split | terminal cd " .. vim.fn.expand("%:p:h") .. " && $SHELL")
end)

vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("terminal cd " .. vim.fn.expand("%:p:h") .. " && $SHELL")
end)

-- chatgpt
vim.keymap.set("n", "<leader>c.", function()
  vim.cmd("vsp | terminal cd " .. vim.fn.expand("%:p:h") .. " && codex")
end)

vim.keymap.set("n", "<leader>c~", function()
    vim.cmd("vsp | terminal codex")
end)

