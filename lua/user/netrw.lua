local status_ok, netrw = pcall(require, "netrw")
if not status_ok then
    return
end

vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 20
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_sizestyle = "H"
vim.g.netrw_localcopydirdmf = "cp -r"
vim.g.netrw_localmkdir = "mkdir -p"
vim.g.netrw_localrmdir = "rm -r"

local opts = { silent = true }
local function remap(new, old)
    vim.api.nvim_set_keymap("n", new, old, opts)
end

remap("<F2>", ":Lexplore<CR>")

netrw.setup({
    icons = {
        symlink = "", -- Symlink icon (directory and file)
        directory = "", -- Directory icon
        file = "", -- File icon
    },
    use_devicons = true,
})
