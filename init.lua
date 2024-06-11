if vim.g.vscode then
	-- Options
	local options = {
		ignorecase = true, -- Ignore case in search patterns.
		smartcase = true, -- Don"t ignore case if search contains uppercase.
		swapfile = false, -- Disable swapfiles.
		backspace = "2", -- Allow backspace over autoindent, eol and start.
		tabstop = 4, -- Number of spaces that a tab uses.
		softtabstop = 4, -- Number of spaces a tab uses when editing.
		showtabline = 2, -- Always show tabline.
		termguicolors = true, -- Enable 24-bit RGB in terminal.
		shiftwidth = 4, -- Number of spaces to use for auto indent.
		expandtab = false, -- Do not replace tabs with spaces.
		textwidth = 97, -- Set max text width to 85 characters.
		wrap = true, -- Wrap text.
		linebreak = true, -- Wrap at logical place.
		foldenable = true,
		smartindent = true, -- Use smart autoindenting.
		splitbelow = true, -- Force new splits to appear below current split.
		splitright = true, -- Force new vertical splits to appear to the right.
		clipboard = "unnamedplus", -- Use system clipboard for neovim.
		scrolloff = 10, -- Start vertical scrolling 10 chars before edge.
		sidescrolloff = 8, -- Start horizontal scrolling 8 chars before edge.
		cursorline = true, -- Highlight line at cursor position.
		cursorlineopt = "line",
	}

	-- Loop through and set options.
	for k, v in pairs(options) do
		vim.opt[k] = v
	end

	vim.cmd("set iskeyword+=-") -- Set "-" to be treated as part of a word.
	vim.cmd("set ww+=h,l") -- Allow h and l to wrap on lines.
else
	require("user.options")
	require("user.plugins")
	require("user.usability")
	require("user.theme")
	require("user.interface")
	require("user.bufferline")
	require("user.pretty_fold")
	require("user.telescope")
	require("user.keymaps")
	require("user.neovide")
	require("user.cmp")
	require("user.lsp")
	require("user.autopairs")
	require("user.nvimtree")
	require("user.null_ls")
	require("user.template")
	require("user.toggleterm")
	require("user.gitsigns")
	require("user.alpha")
	require("user.ufo")
	require("user.neoclip")
end
