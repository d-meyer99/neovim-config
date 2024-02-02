local status_ok, {{_file_name_}} = pcall(require, "{{_variable_}}")
if not status_ok then
    return
end

{{_file_name_}}.setup({
    {{_cursor_}}
})
