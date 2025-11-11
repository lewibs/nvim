vim.keymap.set("n", "<CR>", "i", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("split | terminal cd " .. vim.fn.expand("%:p:h") .. " && $SHELL")
end)

vim.keymap.set("n", "<leader>c.", function()
  vim.cmd("vsp | terminal cd " .. vim.fn.expand("%:p:h") .. " && codex")
end)

vim.keymap.set("n", "<leader>c~", function()
    vim.cmd("vsp | terminal codex")
end)
