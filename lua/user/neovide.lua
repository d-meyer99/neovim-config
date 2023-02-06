local opts = { noremap = true, silent = true }

if vim.g.neovide == true then
	vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", opts)
	vim.g.neovide_transparency = 0.95
	vim.g.neovide_fullscreen = true
end
