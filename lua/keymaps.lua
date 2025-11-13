local function terminal_with_path(layout, command, include_cwd)
  local cd_prefix = ""
  if include_cwd then
    local dir = vim.fn.expand("%:p:h")
    if dir == nil or dir == "" then
      dir = vim.fn.getcwd()
    end
    cd_prefix = "cd " .. vim.fn.shellescape(dir) .. " && "
  end

  local term_cmd = cd_prefix .. command
  if layout and layout ~= "" then
    vim.cmd(("%s | terminal %s"):format(layout, term_cmd))
  else
    vim.cmd(("terminal %s"):format(term_cmd))
  end
end

-- terminal
vim.keymap.set("n", "<leader>ts", function()
  terminal_with_path("split", "$SHELL", true)
end)

vim.keymap.set("n", "<leader>tt", function()
  terminal_with_path(nil, "$SHELL", true)
end)

-- chatgpt
vim.keymap.set("n", "<leader>c.", function()
  terminal_with_path("vsp", "codex", true)
end)

vim.keymap.set("n", "<leader>c~", function()
  terminal_with_path("vsp", "codex", false)
end)
