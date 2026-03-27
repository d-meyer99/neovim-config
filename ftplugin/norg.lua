vim.keymap.set("n", "<leader>ce", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local cursor = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local code_start, code_end, lang

    -- Step 1: find @code <lang>
    for i = cursor - 1, 1, -1 do
        local l = lines[i]
        local match = l:match("^%s*@code%s+(%S+)")
        if match then
            code_start = i + 1
            lang = match
            break
        end
    end

    --Step 2: find @end
    for i = cursor, #lines do
        local l = lines[i]
        if l:match("^%s*@end") then
            code_end = i - 1
            break
        end
    end

    if not (code_start and code_end and lang) then
        vim.notify("Not inside a valid @code block", vim.log.levels.WARN)
        return
    end

    local code_lines = vim.api.nvim_buf_get_lines(bufnr, code_start - 1, code_end, false)

    -- Step 3: Create floating buffer
    local float_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value("filetype", lang, { buf = float_buf })
    vim.api.nvim_buf_set_lines(float_buf, 0, -1, false, code_lines)

    -- local width = math.floor(vim.o.columns * 0.8)
    -- local height = math.floor(vim.o.lines * 0.6)
    -- local row = math.floor((vim.o.lines - height) / 2)
    -- local col = math.floor((vim.o.columns - width) / 2)

    vim.api.nvim_open_win(float_buf, true, {
        -- relative = "editor",
        vertical = true,
        -- row = row,
        -- col = col,
        -- width = width,
        -- height = height,
        -- style = "minimal",
        -- border = "rounded",
    })

    -- Step 4: On close, replace original block content
    vim.api.nvim_create_autocmd("BufLeave", {
        buffer = float_buf,
        once = true,
        callback = function()
            local new_lines = vim.api.nvim_buf_get_lines(float_buf, 0, -1, false)
            vim.api.nvim_buf_set_lines(bufnr, code_start - 1, code_end, false, new_lines)
            -- vim.api.nvim_buf_delete(float_buf, { force = true })
        end,
    })
end, {
    desc = "Edit 2code block in floating buffer",
    buffer = true
}
)
