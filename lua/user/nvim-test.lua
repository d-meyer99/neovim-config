local status_ok, test = pcall(require, "nvim-test")
if not status_ok then
    return
end

test.setup()

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Normal mode remaps
local function nnoremap(new, old)
    keymap("n", new, old, opts)
end

nnoremap("<leader>ta", ":TestSuite<CR>")
nnoremap("<leader>tf", ":TestFile<CR>")
nnoremap("<leader>tn", ":TestNearest<CR>")
