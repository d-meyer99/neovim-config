local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = "<M-t>",
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

local ntop = Terminal:new({ cmd = "ntop", hidden = true })

function _NTOP_TOGGLE()
	ntop:toggle()
end

local ncspot = Terminal:new({ cmd = "ncspot", hidden = true })

function _NCSPOT_TOGGLE()
	ncspot:toggle()
end

local opts = { noremap = true, silent = true }

-- Shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- Normal mode remaps
local function nnoremap(new, old)
	keymap("n", new, old, opts)
end

nnoremap("<M-g>", ":lua _LAZYGIT_TOGGLE()<CR>")
nnoremap("<M-n>", ":lua _NTOP_TOGGLE()<CR>")
nnoremap("<M-s>", ":lua _NCSPOT_TOGGLE()<CR>")
