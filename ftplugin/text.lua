-- Text filetype configuration for adding bash shebang and switching filetype

vim.keymap.set("n", "<leader>sb", function()
  local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
  if first_line and first_line:match("^#!") then
    vim.notify("Shebang already present.", vim.log.levels.INFO)
    return
  end

  -- Insert bash shebang and an empty line
  vim.api.nvim_buf_set_lines(0, 0, 0, false, {
    "#!/usr/bin/env bash",
    ""
  })

  -- Change filetype to bash
  vim.bo.filetype = "bash"
  vim.notify("Set filetype to bash", vim.log.levels.INFO)
end, { buffer = true, desc = "Insert bash shebang and set filetype" })
