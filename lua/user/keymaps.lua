local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten keymap function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode remaps
local function nnoremap(lhs, rhs)
    keymap("n", lhs, rhs, opts)
end

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

-- Close buffer with <Shift-q>
nnoremap("<S-q>", ":TSBufDisable all<cr>:bp|bd #<CR>")

-- Visual Block mode with <C-z>
nnoremap("<C-z>", "<C-q>")

-- gu to go back
nnoremap("<leader>[", "<C-o>")
nnoremap("<leader>]", "<C-i>")

-- <C-i> to increment
keymap("", "<C-i>", "<C-a>", term_opts)

-- <C-q> to kill terminal
keymap("t", "<C-q>", [[<C-\><C-N>]], term_opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope keymaps
nnoremap("<leader>ff", function()
    require("telescope.builtin").find_files(require("telescope.themes").get_ivy())
end)

nnoremap("<leader>fg", function()
    require 'telescope.builtin'.git_files(require('telescope.themes').get_ivy())
end)

nnoremap("<leader>fb", function()
    require 'telescope.builtin'.buffers(require('telescope.themes').get_ivy())
end)

nnoremap("gr", function()
    require 'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown())
end)

nnoremap("<leader>ft", ":Telescope live_grep<cr>")
nnoremap("<leader>p", ":Telescope registers theme=ivy<CR>")

keymap("i", "<C-k>", vim.lsp.buf.signature_help, opts)

-- Space l to format and save
keymap("n", "<leader>l", function()
    vim.lsp.buf.format({
        filter = function(client)
            return client.name ~= "texlab"
        end,
    })
end)

keymap("v", "<leader>l", function()
    vim.lsp.buf.format({
        filter = function(client)
            return client.name ~= "texlab"
        end,
    })
end, { remap = false })

keymap("n", "<leader>-", function()
    require("yazi").yazi()
end, { remap = false })

nnoremap("<M-r>", function()
    vim.wo.relativenumber = not vim.wo.relativenumber
end)

nnoremap("<Up>", ":echo \"Use k\"<cr>")
nnoremap("<Right>", ":echo \"Use l\"<cr>")
nnoremap("<Down>", ":echo \"Use j\"<cr>")
nnoremap("<Left>", ":echo \"Use h\"<cr>")

nnoremap("<S-M-J>", ":m .+1<cr>==")
nnoremap("<S-M-K>", ":m .-2<cr>==")

keymap("v", "<S-K>", ":m '<-2<cr>gv=gv", { remap = false })
keymap("v", "<S-J>", ":m '<+1<cr>gv=gv", { remap = false })
