local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode remaps
local function nnoremap(new, old)
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

-- Visual Block mode with <C-z>
nnoremap("<C-z>", "<C-q>")

-- gb to go back
nnoremap("gu", "<C-t>")

-- Terminal --
-- Open terminal in a horizontal split using <Alt-t>
nnoremap("<M-t>", "<C-w>s<C-w>J:resize -12<CR>:terminal<CR>:setlocal nonumber norelativenumber signcolumn=no<CR>i")
-- <S-q> to kill terminal
keymap("t", "<C-q>", "<C-\\><C-N>:bd!<CR>", term_opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope keymaps
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
keymap("n", "<leader>a", "<cmd>lua require'telescope.builtin'.git_files()<CR>", opts)
keymap("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers()<CR>", opts)
keymap(
	"n",
	"gr",
	"<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown())<CR>",
	opts
)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- NvimTree
nnoremap("<F2>", ":NvimTreeToggle<CR>")
