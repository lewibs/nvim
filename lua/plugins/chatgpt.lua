vim.keymap.set("n", "<leader>c.", function()
  vim.cmd("vsp | terminal cd " .. vim.fn.expand("%:p:h") .. " && codex")
end)

vim.keymap.set("n", "<leader>c~", function()
    vim.cmd("vsp | terminal codex")
end)
