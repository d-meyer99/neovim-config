-- Bash filetype configuration

-- Add <leader>sb to insert shebang and empty line
vim.keymap.set("n", "<leader>sb", function()
  local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
  if first_line and first_line:match("^#!") then
    vim.notify("Shebang already present.", vim.log.levels.INFO)
    return
  end

  vim.api.nvim_buf_set_lines(0, 0, 0, false, {
    "#!/usr/bin/env bash",
    ""
  })
end, { buffer = true, desc = "Insert bash shebang" })

-- Automatically add executable permission on save
vim.api.nvim_create_autocmd("BufWritePost", {
  buffer = 0,
  callback = function()
    local filename = vim.api.nvim_buf_get_name(0)
    if filename == "" then return end

    local perms = vim.fn.getfperm(filename)
    -- Check if the user execute bit is already set
    if not perms:match("^.x") then
      vim.fn.system({ "chmod", "+x", filename })
      vim.notify("Made file executable: " .. filename, vim.log.levels.INFO)
    end
  end,
})
