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

-- <C-q> to kill terminal
keymap("t", "<C-q>", [[<C-\><C-N>]], term_opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope keymaps
keymap(
	"n",
	"<leader>f",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy())<CR>",
	opts
)
keymap(
	"n",
	"<leader>gf",
	"<cmd>lua require'telescope.builtin'.git_files(require('telescope.themes').get_ivy())<CR>",
	opts
)
keymap("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy())<CR>", opts)
keymap(
	"n",
	"gr",
	"<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown())<CR>",
	opts
)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope neoclip theme=ivy<CR>", opts)

-- NvimTree
nnoremap("<F2>", ":NvimTreeToggle<CR>")

-- Template
nnoremap("<leader>t", ":Template ")

-- Ufo
nnoremap("zR", "<cmd>lua require('ufo').openAllFolds()<cr>")
nnoremap("zM", "<cmd>lua require('ufo').closeAllFolds()<cr>")
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of coc.nvim and nvim lsp
		vim.lsp.buf.hover()
	end
end, opts)

vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

-- Alt f to format and save
nnoremap("<M-f>", ":lua vim.lsp.buf.format()<cr>")
vim.keymap.set("v", "<M-f>", vim.lsp.buf.format, { remap = false })
