local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

nvimtree.setup({
    view = {
        width = 35,
        hide_root_folder = false,
        float = {
            enable = true,
            open_win_config = {
                relative = "editor",
                width = 35,
                height = 50,
                row = 1,
                col = 300
            }
        }
    },
    renderer = {
        highlight_git = true,
        group_empty = true,
        full_name = true,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
    },
    filters = {
        dotfiles = false,
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
})
