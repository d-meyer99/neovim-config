local status_ok, theme = pcall(require, "monokai-pro")
if not status_ok then
    return
end

theme.setup({
    transparent_background = true,
    terminal_colors = true,
    devicons = true, -- highlight the icons of `nvim-web-devicons`
    styles = {
        comment = { italic = true },
        keyword = { italic = true }, -- any other keyword
        type = { italic = true }, -- (preferred) int, long, char, etc
        storageclass = { italic = true }, -- static, register, volatile, etc
        structure = { italic = true }, -- struct, union, enum, etc
        parameter = { italic = true }, -- parameter pass in function
        annotation = { italic = true },
        tag_attribute = { italic = true }, -- attribute of tag in reactjs
    },
    filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
    inc_search = "underline", -- underline | background
    background_clear = {
        -- "float_win",
        "toggleterm",
        "telescope",
        -- "which-key",
        "renamer",
        "notify",
        "nvim-tree",
        -- "neo-tree",
    }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree"
    plugins = {
        indent_blankline = {
            context_highlight = "default", -- default | pro
            context_start_underline = false,
        },
    },
})

vim.cmd("colorscheme monokai-pro")
vim.api.nvim_set_hl(0, "CursorLine", { underline = true })
