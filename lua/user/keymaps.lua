local opts ={ noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode remaps
function nnoremap(new, old)
	keymap("n", new, old, opts)
end

nnoremap("<F5>", "<C-l>:noh<CR>")

-- Split navigation with <C-[hjkl]>
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Resize splits with <C-[Arrows]>
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")

-- Close split with <C-q>
nnoremap("<C-q>", "<C-w>q")

-- Move buffers with <Shift-[hl]>
nnoremap("<S-h>", ":bp<CR>")
nnoremap("<S-l>", ":bn<CR>")

-- Close buffer with <Shift-q>
nnoremap("<S-q>", ":bd<CR>")
