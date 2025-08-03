local plugin_name = "iron"
local status_ok, plugin = pcall(require, plugin_name)
if not status_ok then
    print(string.format("Failed to load %s", plugin_name))
    return
end

plugin.setup {
    config = {
        repl_definition = {
            haskell = {
                command = { "ghci" },
            },
        },
        repl_open_cmd = "horizontal botright 20 split",
    },
    keymaps = {
        send_motion = "<leader>isc",
        visual_send = "<leader>isc",
        send_file = "<leader>isf",
        send_line = "<leader>isl",
        send_mark = "<leader>ism",
        mark_motion = "<leader>imc",
        mark_visual = "<leader>imc",
        remove_mark = "<leader>imd",
        cr = "<leader>is<cr>",
        interrupt = "<leader>is<space>",
        exit = "<leader>isq",
        clear = "<leader>icl",
    },
}
